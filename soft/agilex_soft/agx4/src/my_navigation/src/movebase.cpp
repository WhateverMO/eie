#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <std_srvs/Empty.h>
#include <std_msgs/String.h>

#define DEG2RAD(x) ((x)*M_PI/180.0)
#define D_XY 0.3
#define D_YAW 10
#define RETRY_TIMES 3

bool moving = false;

// x,y,yaw
double maps[2][7][3] = {
    {//map0
        {-0.02, -1.03, -161.21},//A
        {2.91, -2.60, -75.57},//B
        {3.73, 1.00, 102.39},//C
        {5.20, -0.80, 16.40},//D
        {-0.21, -2.04, -57.83},//B
        {-0.21, -2.04, -57.83},//B
        {-2.88, -3.88, 82.94}//D
    },
    {//map1
        {-5.23, -2.00, -4.87},//A
        {-0.55, -1.44, -94.77},//B
        {0.31, -4.25, 170.04},//C
        {-2.95, -4.66, 82.94},//D
        {-0.21, -2.04, -57.83},//B
        {-0.42, -1.81, -69.23},//B
        {-2.88, -3.88, 82.94}//D
    }
};

bool initial = true;

// 创建ROS节点句柄
ros::NodeHandle *nh_;

ros::Subscriber sub,pose_sub;
ros::ServiceClient clear_costmaps_client;

int nowPositon = -1,map = -1,nowX = -1,nowY = -1,nowZ = -1,nowW = -1;

bool moveBase(int map,int end){
    bool result = true;
    ros::NodeHandle nh = *nh_;
    ROS_INFO("======================================================");
    ROS_INFO("callback end:%d",end);

    if( nowPositon == end ){
        ROS_INFO("The robot is in the goal");
        return true;
    }

    // clear costmaps
    std_srvs::Empty srv;
    if (!clear_costmaps_client.call(srv))
    {
        ROS_ERROR("Failed to call service clear_costmaps");
    }else{
        ROS_INFO("clear costmaps");
    }

    actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> ac("move_base", true);

    // nh.setParam("planner_frequency", 1.0); // Set the planner frequency
    // nh.setParam("controller_frequency", 1.0); // Set the controller frequency
    // nh.setParam("recovery_behavior_enabled", true); // Enable recovery behavior
    // nh.setParam("clearing_rotation_allowed", true); // Allow the robot to rotate in place to clear out space
    // nh.setParam("shutdown_costmaps", true); // Shutdown the costmaps when the node shuts down

    while (!ac.waitForServer(ros::Duration(5.0)))
    {
        ROS_INFO("Waiting for the move_base action server to come up");
    }

    // // Compare the starting position to the current position
    // // If they are out of D_XY of each other, translate the orientation to yaw if yaw out of D_YAW, change the initial pose
    // // set orientation to yaw angle
    // tf2::Quaternion q_now;
    // q_now.setX(nowX);
    // q_now.setY(nowY);
    // q_now.setZ(nowZ);
    // q_now.setW(nowW);
    // double roll, pitch, yaw_now;
    // tf2::Matrix3x3(q_now).getRPY(roll, pitch, yaw_now);
    
    // if (!initial) if ( fabs(start_pose.pose.pose.position.x - nowX) > D_XY || fabs(start_pose.pose.pose.position.y - nowY) > D_XY || fabs(yaw - yaw_now) > D_YAW)
    // {
    //     ROS_INFO("do not finish the goal,Setting the now pos as initial pose,and retry!!!");
    //     start_pose.pose.pose.position.x = nowX;
    //     start_pose.pose.pose.position.y = nowY;
    //     start_pose.pose.pose.orientation.z = nowZ;
    //     start_pose.pose.pose.orientation.w = nowW;
    //     end = begin;
    //     result = false;
    // }
    double endX = maps[map][end][0], endY = maps[map][end][1], endYaw = maps[map][end][2];
    
    ROS_INFO("map:%d,end:%d",map,end);
    ROS_INFO("endX:%f,endY:%f,endYaw:%f",endX,endY,endYaw);

    // Set the Car's goal position
    move_base_msgs::MoveBaseGoal goal;
    goal.target_pose.header.frame_id = "map";
    goal.target_pose.header.stamp = ros::Time::now();
    goal.target_pose.pose.position.x = endX;
    goal.target_pose.pose.position.y = endY;

    tf2::Quaternion quat;
    // Set the yaw angle of the goal orientation
    double yaw = endYaw;
    quat.setRPY(0, 0, yaw*M_PI/180);
    goal.target_pose.pose.orientation.x = quat.x();
    goal.target_pose.pose.orientation.y = quat.y();
    goal.target_pose.pose.orientation.z = quat.z();
    goal.target_pose.pose.orientation.w = quat.w();

    // Send the goal to the move_base action server
    ac.sendGoal(goal);

    ac.waitForResult();

    for(int i = 0;i <= RETRY_TIMES && (ac.getState() != actionlib::SimpleClientGoalState::SUCCEEDED);i++)
    {
        ROS_INFO("The robot failed to reach the goal then retry");
        // retry the goal
        ac.sendGoal(goal);
        ac.waitForResult();
    }
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
        ROS_INFO("Hooray, the robot reached the goal");
        nowPositon = end;
        result = true;
    }else{
        result = false;
    }

    ROS_INFO("======================================================");
    //wait for 5 seconds
    // ros::Duration(5.0).sleep();
    
    initial = false;
    return result;
}

void callback(const std_msgs::String::ConstPtr& msg)
{
    ros::Rate loop_rate(1);
    char letter = msg->data[0];
    int index = -1;
    ROS_INFO("***I saw: [%c],[%d]***", letter,moving);
    if(moving){
        ROS_INFO("***The robot is moving,drop the message***");
        return;
    }
    moving = true;
    ROS_INFO("***[%d]***", moving);
    switch (letter)
    {
    case 'A':
        index = 0;
        break;
    case 'B':
        index = 1;
        break;
    case 'C':
        index = 2;
        break;
    case 'D':
        index = 3;
        break;
    default:
        index = -1;
        break;
    }
    if(index!=-1){
        if(index == 1){
            moveBase(map,index+3);
            moveBase(map,index+4);
        }else if (index == 3){
            moveBase(map,index+3);
        }
        if(moveBase(map,index)) nowPositon = index;
    }
    loop_rate.sleep();
    initial = false;
    moving = false;
}

void poseCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg)
{
    nowX = msg->pose.pose.position.x;
    nowY = msg->pose.pose.position.y;
    nowZ = msg->pose.pose.orientation.z;
    nowW = msg->pose.pose.orientation.w;
}

int main(int argc, char** argv)
{
    // 创建ROS节点
    ros::init(argc, argv, "movebase");

    // 创建ROS节点句柄
    ros::NodeHandle nh;

    nh_ = &nh;

    while(map!=0&&map!=1){
        std::cout<<"Please input map(0 or 1):"<<std::endl;
        std::cin>>map; 

        if(map==0||map==1){
            break;
        }
    }

    // while(nowPositon!=0&&nowPositon!=1&&nowPositon!=2&&nowPositon!=3){
    //     std::cout<<"Please input nowPositon(0 or 1 or 2 or 3):"<<std::endl;
    //     std::cin>>nowPositon; 

    //     if(nowPositon==0||nowPositon==1||nowPositon==2||nowPositon==3){
    //         break;
    //     }
    // }

    // double beginX = maps[map][nowPositon][0], beginY = maps[map][nowPositon][1], beginYaw = maps[map][nowPositon][2];

    // // Set the Car's starting position
    // geometry_msgs::PoseWithCovarianceStamped start_pose;
    // start_pose.header.frame_id = "map";
    // start_pose.header.stamp = ros::Time::now();
    // start_pose.pose.pose.position.x = beginX;
    // start_pose.pose.pose.position.y = beginY;

    // // Set the yaw angle of the starting orientation
    // double yaw = beginYaw;
    // tf2::Quaternion quat;
    // quat.setRPY(0, 0, yaw*M_PI/180);
    // start_pose.pose.pose.orientation.x = quat.x();
    // start_pose.pose.pose.orientation.y = quat.y();
    // start_pose.pose.pose.orientation.z = quat.z();
    // start_pose.pose.pose.orientation.w = quat.w();

    // // Publish the starting position to the /initialpose topic
    // ros::Publisher initial_pose_pub = nh.advertise<geometry_msgs::PoseWithCovarianceStamped>("/initialpose", 1, true);
    // initial_pose_pub.publish(start_pose);


    // ROS_INFO("beginX:%f,beginY:%f,beginYaw:%f",beginX,beginY,beginYaw);

    initial = true;

    moving = false;

    sub = nh.subscribe("/recognize", 1, callback);
    pose_sub = nh.subscribe("/amcl_pose", 1, poseCallback);
    clear_costmaps_client = nh.serviceClient<std_srvs::Empty>("/move_base/clear_costmaps");

    ros::spin();

    return 0;
}