#include"ros/ros.h"

#include <sensor_msgs/PointCloud2.h> //ros中的点云类型

#include "pcl/point_cloud.h" //pcl点云类型头文件

#include "pcl/point_types.h"

#include "pcl_conversions/pcl_conversions.h" //pcl与ros之间转换头文件

#include "pcl/filters/passthrough.h" //pcl直通滤波头文件

#include <rosbag/bag.h>

#include <rosbag/view.h>

#include <std_msgs/String.h>

#include <sensor_msgs/PointCloud2.h>


// int main(int argc, char *argv[]) 
// {
//     ros::init(argc, argv, "bag_publisher");
//     ros::NodeHandle nh;

//     // 创建一个发布者来发布激光点云数据
//     ros::Publisher lidar_pub = nh.advertise<sensor_msgs::PointCloud2>("lidar_data", 10);

//     // 打开.bag文件
//     rosbag::Bag bag;
//     bag.open("/home/lz/下载/data/ros_data/lidar2022-09-06-10-55-29.bag", rosbag::bagmode::Read);

//     // 遍历.bag文件并发布点云数据
//     rosbag::View view(bag);
//     for (rosbag::MessageInstance const& msg : view) {
//         sensor_msgs::PointCloud2::ConstPtr pc_msg = msg.instantiate<sensor_msgs::PointCloud2>();
//         if (pc_msg != nullptr) {
//             ROS_INFO("Publishing Lidar Data");
//             lidar_pub.publish(*pc_msg);
//             ros::spinOnce();
//         }
//     }

//     bag.close();
//     return 0;
// } 
// 创建一个发布者来发布激光点云数据
// 打开.bag文件
// 遍历.bag文件并发布点云数据
// 关闭.bag文件
// 关闭发布者
// 关闭节点

#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <sensor_msgs/LaserScan.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <string>


int main(int argc, char *argv[]) 
{
    ros::init(argc, argv, "bag_publisher");
    ros::NodeHandle nh;

    // 创建一个发布者来发布激光点云数据
    ros::Publisher lidar_pub = nh.advertise<sensor_msgs::PointCloud2>("lidar_data", 10);
    ros::Publisher lidar_pcl_pub = nh.advertise<sensor_msgs::PointCloud2>("lidar_pcl_data", 10);

    // 打开.bag文件
    rosbag::Bag bag;
    std::string bagPath;
    std::cout<<"please enter the bag path:"<<std::endl;
    std::cin>>bagPath;
    bag.open(bagPath, rosbag::bagmode::Read);

    // 遍历.bag文件并发布点云数据 遍历完一次后再次遍历
    rosbag::View view(bag);
    for (rosbag::MessageInstance const m : view)
    {
        sensor_msgs::PointCloud2::ConstPtr cloud = m.instantiate<sensor_msgs::PointCloud2>();
        if (cloud != NULL)
        {
            lidar_pub.publish(cloud);
            sensor_msgs::PointCloud2 lidar_pcl_msg;
            pcl::PointCloud<pcl::PointXYZI> lidar_pcl;
            pcl::fromROSMsg(*cloud, lidar_pcl);
            pcl::toROSMsg(lidar_pcl, lidar_pcl_msg);
            lidar_pcl_msg.header.stamp = ros::Time::now();
            lidar_pcl_msg.header.frame_id = "map";
            lidar_pcl_pub.publish(lidar_pcl_msg);
            ros::spinOnce();
            ros::Duration(2).sleep();
        }
    }

    bag.close();
    return 0;
}