#include "ros/ros.h"

#include <sensor_msgs/PointCloud2.h> //ros中的点云类型

#include "pcl/point_cloud.h" //pcl点云类型头文件

#include "pcl/point_types.h"

#include "pcl_conversions/pcl_conversions.h" //pcl与ros之间转换头文件

#include "pcl/filters/passthrough.h" //pcl直通滤波头文件

ros::Publisher laser_pub;

void lasercallback(sensor_msgs::PointCloud2ConstPtr lasercloudmsg)
{

    pcl::PointCloud<pcl::PointXYZI>::Ptr lasercloud_in(new pcl::PointCloud<pcl::PointXYZI>);

    pcl::PointCloud<pcl::PointXYZI>::Ptr lasercloud_filtered(new pcl::PointCloud<pcl::PointXYZI>); // 将ros消息转成pcl点云

    pcl::fromROSMsg(*lasercloudmsg, *lasercloud_in);

    // 创建滤波器对象

    pcl::PassThrough<pcl::PointXYZI> pass;

    pass.setInputCloud(lasercloud_in);

    pass.setFilterFieldName("x"); // 滤波字段名被设置为z轴方向

    pass.setFilterLimits(0.0, 1000); // 设置在过滤方向上的过滤范围

    // pass.setKeepOrganized(true); //保持有序点云结构，该功能用于有序点云才有意义。

    pass.setNegative(false); // 设置保留范围内的点还是过滤掉范围内的点，标志为false时保留范围内的点
    pass.filter(*lasercloud_filtered);

        sensor_msgs::PointCloud2 cloud_filtered_msg;

    pcl::toROSMsg(*lasercloud_filtered, cloud_filtered_msg);

    cloud_filtered_msg.header.stamp = ros::Time::now();

    cloud_filtered_msg.header.frame_id = "base_link";
    laser_pub.publish(cloud_filtered_msg);
}

int main(int argc, char *argv[])
{

    ros::init(argc, argv, "passthrough");

    ros::NodeHandle n;

    ros::Subscriber laser_sub = n.subscribe<sensor_msgs::PointCloud2>("/rslidar_points", 10, lasercallback);

    laser_pub = n.advertise<sensor_msgs::PointCloud2>("/velodyne_points",10);

    ros::spin();

    return 0;
}
