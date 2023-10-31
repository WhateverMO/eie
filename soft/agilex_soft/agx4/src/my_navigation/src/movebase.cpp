#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <std_msgs/String.h>

// x,y,yaw
double maps[2][4][3] = {
    {//map0
        {-0.02, -1.03, -161.21},//A
        {2.91, -2.60, -75.57},//B
        {3.73, 1.00, 102.39},//C
        {5.20, -0.80, 16.40}//D
    },
    {//map1
        {-5.17, -1.87, -8.07},//A
        {-0.35, -1.70, -95.05},//B
        {0.14, -4.05, 170.04},//C
        {-0.35, -4.36, 82.78}//D
    }
};

// 创建ROS节点句柄
ros::NodeHandle *nh_;

ros::Subscriber sub;

int nowPositon = -1,map = -1;

void moveBase(int map,int begin, int end){
    ros::NodeHandle nh = *nh_;

    if(begin==end){
        ROS_INFO("begin==end");
        return;
    }

    double beginX = maps[map][begin][0], beginY = maps[map][begin][1], beginYaw = maps[map][begin][2];
    double endX = maps[map][end][0], endY = maps[map][end][1], endYaw = maps[map][end][2];
    ROS_INFO("======================================================");
    ROS_INFO("map:%d,begin:%d,end:%d",map,begin,end);
    ROS_INFO("beginX:%f,beginY:%f,beginYaw:%f",beginX,beginY,beginYaw);
    ROS_INFO("endX:%f,endY:%f,endYaw:%f",endX,endY,endYaw);

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

    // Set the Car's starting position
    geometry_msgs::PoseWithCovarianceStamped start_pose;
    start_pose.header.frame_id = "map";
    start_pose.header.stamp = ros::Time::now();
    start_pose.pose.pose.position.x = beginX;
    start_pose.pose.pose.position.y = beginY;

    // Set the yaw angle of the starting orientation
    double yaw = beginYaw;
    tf2::Quaternion quat;
    quat.setRPY(0, 0, yaw*M_PI/180);
    start_pose.pose.pose.orientation.x = quat.x();
    start_pose.pose.pose.orientation.y = quat.y();
    start_pose.pose.pose.orientation.z = quat.z();
    start_pose.pose.pose.orientation.w = quat.w();

    // Publish the starting position to the /initialpose topic
    ros::Publisher initial_pose_pub = nh.advertise<geometry_msgs::PoseWithCovarianceStamped>("/initialpose", 1, true);
    initial_pose_pub.publish(start_pose);

    // Set the Car's goal position
    move_base_msgs::MoveBaseGoal goal;
    goal.target_pose.header.frame_id = "map";
    goal.target_pose.header.stamp = ros::Time::now();
    goal.target_pose.pose.position.x = endX;
    goal.target_pose.pose.position.y = endY;

    // Set the yaw angle of the goal orientation
    yaw = endYaw;
    quat.setRPY(0, 0, yaw*M_PI/180);
    goal.target_pose.pose.orientation.x = quat.x();
    goal.target_pose.pose.orientation.y = quat.y();
    goal.target_pose.pose.orientation.z = quat.z();
    goal.target_pose.pose.orientation.w = quat.w();

    // Send the goal to the move_base action server
    ac.sendGoal(goal);

    ac.waitForResult();

    if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
        ROS_INFO("Hooray, the robot reached the goal");
    }
    else
    {
        ROS_INFO("The robot failed to reach the goal");
    }

    ROS_INFO("======================================================");
    //wait for 5 seconds
    // ros::Duration(5.0).sleep();
}

void callback(const std_msgs::String::ConstPtr& msg)
{
    char letter = msg->data[0];
    int index = -1;
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
        break;
    }
    if(index!=-1){
        if(nowPositon==-1){
            nowPositon = index;
        }else{
            moveBase(map,nowPositon,index);
            nowPositon = index;
        }
    }
}

int main(int argc, char** argv)
{
    // 创建ROS节点
    ros::init(argc, argv, "mymovebase");

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

    while(nowPositon!=0&&nowPositon!=1&&nowPositon!=2&&nowPositon!=3){
        std::cout<<"Please input nowPositon(0 or 1 or 2 or 3):"<<std::endl;
        std::cin>>nowPositon; 

        if(nowPositon==0||nowPositon==1||nowPositon==2||nowPositon==3){
            break;
        }
    }

    sub = nh.subscribe("/recognize", 1, callback);

    ros::spin();

    return 0;
}