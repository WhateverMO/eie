//class sensorView

#ifndef SENSORVIEW_H
#define SENSORVIEW_H

#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/PointCloud2.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <boost/thread/thread.hpp>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>
#include <string>

class sensorView
{
public:
    sensorView(std::string mode);
    ~sensorView();
    void getCarVelocity(const nav_msgs::Odometry::ConstPtr& msg);
    void getCameraImageRgb(const sensor_msgs::ImageConstPtr& msgRGB);
    void getCameraImageDepth(const sensor_msgs::ImageConstPtr& msgDepth);
    void getLidarData(const sensor_msgs::PointCloud2ConstPtr& msg);
private:
    // ros::NodeHandle nh_velocities;
    // ros::NodeHandle nh_images_rgb;
    // ros::NodeHandle nh_images_depth;
    // ros::NodeHandle nh_lidar;
    ros::Subscriber subCarVelocity;
    ros::Subscriber subCameraImageRGB;
    ros::Subscriber subCameraImageDepth;
    ros::Subscriber subLidarData;
    boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer;
    double carLinearVelocity;
    double carAngularVelocity;
};

#endif // SENSORVIEW_H