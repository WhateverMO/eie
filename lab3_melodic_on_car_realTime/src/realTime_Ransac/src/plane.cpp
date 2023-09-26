#include "ros/ros.h"
#include <sensor_msgs/PointCloud2.h> //ros中的点云类型
#include "pcl/point_cloud.h" //pcl点云类型头文件
#include "pcl_conversions/pcl_conversions.h" //ros与pcl数据转换的头文件
#include <pcl/filters/voxel_grid.h> //滤波的头文件
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <boost/thread/thread.hpp>
#include <boost/random.hpp>
#include <string>

#define LeafSize 0.06f
#define Iter_maxNum 1000 //迭代次数
#define MaxD 0.01 //距离阈值

using namespace std;

ros::Publisher laser_plane1_pub,laser_plane2_pub,laser_plane3_pub;

boost::random::mt19937 gen(time((time_t *)NULL)); //随机数生成器

vector<int> RANCAC_plane(pcl::PointCloud<pcl::PointXYZI>::Ptr lasercloud_in, int iter_maxNum, float maxD,bool reject_groud = false)
{
    vector<int> inliersResult;
    int lasercloud_in_pointsNum = lasercloud_in->points.size(),iterNum = 0; //点云数量
    int inPlaneNum_Max = 0; //最大内点数
    float A_best = 0, B_best = 0, C_best = 0, D_best = 0; //最优平面参数
    boost::uniform_int<> dist(0, lasercloud_in_pointsNum - 1); //随机数分布
    while((iterNum < iter_maxNum) && inPlaneNum_Max <= lasercloud_in_pointsNum)
    {
        iterNum++;
        int inPlaneNum = 0; //内点数
        int index1 = dist(gen), index2 = dist(gen), index3 = dist(gen); //随机选取三个点
        float x1 = lasercloud_in->points[index1].x, y1 = lasercloud_in->points[index1].y, z1 = lasercloud_in->points[index1].z;
        float x2 = lasercloud_in->points[index2].x, y2 = lasercloud_in->points[index2].y, z2 = lasercloud_in->points[index2].z;
        float x3 = lasercloud_in->points[index3].x, y3 = lasercloud_in->points[index3].y, z3 = lasercloud_in->points[index3].z;
        float A = (y2 - y1) * (z3 - z1) - (z2 - z1) * (y3 - y1); //平面参数
        float B = (z2 - z1) * (x3 - x1) - (x2 - x1) * (z3 - z1);
        float C = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1);
        float D = -(A * x1 + B * y1 + C * z1);
        float norm = sqrt(A * A + B * B + C * C); //平面法向量模长
        A /= norm, B /= norm, C /= norm, D /= norm; //单位化
        if(reject_groud)
        {
            if(fabs(A) < 0.1 && fabs(B) < 0.1 && fabs(C) > 0.9) //排除地面
                continue;
        }
        vector<int> inliers = { 0 };
        for(int i = 0; i < lasercloud_in_pointsNum; i++)
        {
            float x = lasercloud_in->points[i].x, y = lasercloud_in->points[i].y, z = lasercloud_in->points[i].z;
            float dist = fabs(A * x + B * y + C * z + D); //点到平面距离
            if(dist < maxD)
            {
                inliers.push_back(i);
                inPlaneNum++;
            }
        }
        if(inPlaneNum > inPlaneNum_Max)
        {
            inPlaneNum_Max = inPlaneNum;
            inliersResult = inliers;
            A_best = A, B_best = B, C_best = C, D_best = D;
        }
    }
    return inliersResult;
}

vector<int> getVectorSet(pcl::PointCloud<pcl::PointXYZI>::Ptr lasercloud_in)
{
    vector<int> v;
    for (size_t i = 0; i < lasercloud_in->points.size(); i++)
    {
        v.push_back(i);
    }
    return v;
}

vector<int> getDifference(vector<int> v1, vector<int> v2)
{
    vector<int> v3;
    sort(v1.begin(), v1.end());
    sort(v2.begin(), v2.end());
    set_difference(v1.begin(), v1.end(), v2.begin(), v2.end(), inserter(v3, v3.begin()));
    return v3;
}

void lasercallback(sensor_msgs::PointCloud2ConstPtr lasercloudmsg)
{

    pcl::PointCloud<pcl::PointXYZI>::Ptr lasercloud_in(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::fromROSMsg(*lasercloudmsg, *lasercloud_in);

    pcl::VoxelGrid<pcl::PointXYZI> voxel_filter;
    voxel_filter.setLeafSize(LeafSize, LeafSize, LeafSize);
    voxel_filter.setInputCloud(lasercloud_in);
    voxel_filter.filter(*lasercloud_in);

    vector<int> inliers;
    inliers = RANCAC_plane(lasercloud_in, Iter_maxNum, MaxD);

    pcl::PointCloud<pcl::PointXYZRGB>::Ptr lasercloud_filtered_rgb(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::copyPointCloud(*lasercloud_in, inliers, *lasercloud_filtered_rgb);

    //set filtered pointcloud color
    for (size_t i = 0; i < lasercloud_filtered_rgb->points.size(); i++)
    {
        lasercloud_filtered_rgb->points[i].r = 0;
        lasercloud_filtered_rgb->points[i].g = 255;
        lasercloud_filtered_rgb->points[i].b = 0;
    }

    sensor_msgs::PointCloud2 cloud_filtered_msg;
    pcl::toROSMsg(*lasercloud_filtered_rgb, cloud_filtered_msg);
    cloud_filtered_msg.header.stamp = ros::Time::now();
    cloud_filtered_msg.header.frame_id = "base_link";
    laser_plane1_pub.publish(cloud_filtered_msg);

    pcl::PointCloud<pcl::PointXYZI>::Ptr lasercloud_out(new pcl::PointCloud<pcl::PointXYZI>);
    //get the difference set between the original pointcloud and the filtered pointcloud
    vector<int> differenceSet = getDifference(getVectorSet(lasercloud_in), inliers);

    pcl::copyPointCloud(*lasercloud_in, differenceSet, *lasercloud_out);

    sensor_msgs::PointCloud2 cloud_out_msg;
    pcl::toROSMsg(*lasercloud_out, cloud_out_msg);
    cloud_out_msg.header.stamp = ros::Time::now();
    cloud_out_msg.header.frame_id = "base_link";
    laser_plane2_pub.publish(cloud_out_msg);

    vector<int> inliers2;
    inliers2 = RANCAC_plane(lasercloud_out, Iter_maxNum, MaxD,true);

    pcl::PointCloud<pcl::PointXYZRGB>::Ptr lasercloud_filtered_rgb2(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::copyPointCloud(*lasercloud_out, inliers2, *lasercloud_filtered_rgb2);

    //set filtered pointcloud color
    for (size_t i = 0; i < lasercloud_filtered_rgb2->points.size(); i++)
    {
        lasercloud_filtered_rgb2->points[i].r = 255;
        lasercloud_filtered_rgb2->points[i].g = 0;
        lasercloud_filtered_rgb2->points[i].b = 0;
    }

    sensor_msgs::PointCloud2 cloud_filtered_msg2;
    pcl::toROSMsg(*lasercloud_filtered_rgb2, cloud_filtered_msg2);
    cloud_filtered_msg2.header.stamp = ros::Time::now();
    cloud_filtered_msg2.header.frame_id = "base_link";
    laser_plane3_pub.publish(cloud_filtered_msg2);

}

int main(int argc, char *argv[])
{

    ros::init(argc, argv, "plane");

    ros::NodeHandle n;

    ros::Subscriber laser_sub = n.subscribe<sensor_msgs::PointCloud2>("/rslidar_points", 10, lasercallback);

    laser_plane1_pub = n.advertise<sensor_msgs::PointCloud2>("/plane1_points",10);
    laser_plane2_pub = n.advertise<sensor_msgs::PointCloud2>("/plane2_points",10);
    laser_plane3_pub = n.advertise<sensor_msgs::PointCloud2>("/plane3_points",10);

    ros::spin();

    return 0;
}