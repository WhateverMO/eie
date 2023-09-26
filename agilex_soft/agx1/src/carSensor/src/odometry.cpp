#define DistanceC 1.03

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Twist.h>

double x = 0.0;
double y = 0.0;
double th = 0.0;
double length = 0.0;

double px_last = 0;
double py_last = 0;
double pz_last = 0;
double qw_last = 0;
double qx_last = 0;
double qy_last = 0;
double qz_last = 0;
double yaw_last = 0;

bool first = true;

void odomCallback(const nav_msgs::Odometry::ConstPtr& msg){  
    // Get the position and orientation from the message
    double px = msg->pose.pose.position.x;
    double py = msg->pose.pose.position.y;
    double pz = msg->pose.pose.position.z;
    double qw = msg->pose.pose.orientation.w;
    double qx = msg->pose.pose.orientation.x;
    double qy = msg->pose.pose.orientation.y;
    double qz = msg->pose.pose.orientation.z;
    // Convert the quaternion to Euler angles
    tf::Quaternion q(qx, qy, qz, qw);
    tf::Matrix3x3 m(q);
    double roll, pitch, yaw;
    m.getRPY(roll, pitch, yaw);
    if(first){
        first = false;
    }
    else{
        // Update the robot's position and orientation
        x += px - px_last;
        y += py - py_last;
        th += yaw - yaw_last;
        //calculate length
        length += sqrt(pow(px-px_last,2)+pow(py-py_last,2));
    }
    //update last position
    px_last = px;
    py_last = py;
    pz_last = pz;
    qw_last = qw;
    qx_last = qx;
    qy_last = qy;
    qz_last = qz;
    yaw_last = yaw;
}
int main(int argc, char** argv){
    ros::init(argc, argv, "odometry");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("odom", 1000, odomCallback);
    ros::Rate r(10.0);
    //record time
    ros::Time current_time, last_time;
    current_time = ros::Time::now();
    last_time = ros::Time::now();
    while(n.ok()){
        ros::spinOnce();
        current_time = ros::Time::now();
        std::cout<<"odom:"<<std::endl;
        std::cout<<"x:"<<x<<" y:"<<y<<" th:"<<th<<std::endl;
        std::cout<<"time:"<<current_time<<std::endl;
        std::cout<<"length:"<<length*DistanceC<<"m"<<std::endl;
        std::cout<<"distance:"<<sqrt(pow(x,2)+pow(y,2))*DistanceC<<"m"<<std::endl;
        std::cout<<"-------------------"<<std::endl;
        last_time = current_time;
        r.sleep();
    }
    return 0;
}