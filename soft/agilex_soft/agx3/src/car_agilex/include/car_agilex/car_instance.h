#ifndef CAR_INSTANCE_H_
#define CAR_INSTANCE_H_

#include <string>

#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <nav_msgs/Odometry.h>
#include <visualization_msgs/Marker.h>
#include "ugv_sdk/scout/scout_base.hpp"

#include "car_agilex/ScoutState.h"
#include "car_agilex/ScoutLightCmd.h"
#include "car_agilex/ScoutMotionCmd.h"

#define ROS_RATE 30
#define motor_num 4
#define max_distance 0.2
#define vector_length 1
#define topic_name "scout_state"
#define service_name_light "scout_light_cmd"
#define service_name_motion "scout_motion_cmd"

class CarInstance
{
public:
    CarInstance(ros::NodeHandle nh,std::string device_name = "can0", int baudrate = 0);
    ~CarInstance();

    void run();
private:
    void scoutStatePublish();
    void scoutMarkerPublishImu(const sensor_msgs::Imu::ConstPtr& msg);
    void scoutMarkerPublishOdom(const nav_msgs::Odometry::ConstPtr& msg);
    bool scoutLightCallback(car_agilex::ScoutLightCmd::Request &req, car_agilex::ScoutLightCmd::Response &res);
    bool scoutMotionCallback(car_agilex::ScoutMotionCmd::Request &req, car_agilex::ScoutMotionCmd::Response &res);

    double imu_x,imu_y,imu_z,imu2_x,imu2_y,imu2_z,odom_x,odom_y,odom_z,odom2_x,odom2_y,odom2_z,time_now,time_last;
    double imu_x_last,imu_y_last,imu_z_last,imu2_x_last,imu2_y_last,imu2_z_last,odom_x_last,odom_y_last,odom_z_last,odom2_x_last,odom2_y_last,odom2_z_last;
    double imu_av_x,imu_av_y,imu_av_z,imu_lv_x,imu_lv_y,imu_lv_z;
    visualization_msgs::Marker imu_points,imu_strip,imu_list,odom_points,odom_strip,odom_list;


    ros::NodeHandle nh_;
    ros::Subscriber imu_sub_,odom_sub_;
    ros::Publisher scout_state_pub_,marker_pub_imu_,marker_pub_odom_;
    ros::ServiceServer scout_light_srv_;
    ros::ServiceServer scout_motion_srv_;

    westonrobot::ScoutBase scout_;
};

#endif