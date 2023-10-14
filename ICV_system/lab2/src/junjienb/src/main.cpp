#include<ros/ros.h>
#include<sensor_msgs/Image.h>
#include<cv_bridge/cv_bridge.h>
#include<sensor_msgs/image_encodings.h>
#include<iostream>
#include<string>
#include<vector>
#include<opencv2/imgproc.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/features2d/features2d.hpp>

using namespace std;

ros::Publisher gray_pub,fast_pub,edge_pub,all_pub;

void callback_rgb(const sensor_msgs::ImageConstPtr imag_rgb_in)
{
    cv_bridge::CvImagePtr image_msgs_bridge;//指针
    image_msgs_bridge = cv_bridge::toCvCopy(imag_rgb_in,sensor_msgs::image_encodings::BGR8);
    cv::Mat image_rgb = image_msgs_bridge->image;

    cv::Mat image_gray;
    cv::cvtColor(image_rgb,image_gray,cv::COLOR_BGR2GRAY);//转换成灰度图像

    sensor_msgs::ImagePtr image_gray_msg = cv_bridge::CvImage(std_msgs::Header(),"mono8",image_gray).toImageMsg();
    gray_pub.publish(image_gray_msg);


    //Fast特征点提取

    // cv_bridge::CvImagePtr image_msgs_bridge2
    // image_msgs_bridge2 = cv_bridge::toCvCopy(image_rgb_in,sensor_msgs::image_encodings::BGR8);
    
    cv::Mat input_image = image_msgs_bridge->image,output_image;
    cv::Ptr<cv::FastFeatureDetector> detector = cv::FastFeatureDetector::create(60);
    std::vector<cv::KeyPoint> keypoints;
    detector->detect(image_gray,keypoints);
    cv::drawKeypoints(input_image,keypoints,output_image);
    sensor_msgs::ImagePtr image_fast_msg = cv_bridge::CvImage(std_msgs::Header(),"bgr8",output_image).toImageMsg();
    fast_pub.publish(image_fast_msg);

    //边缘提取
    cv::Mat image_edge;
    cv::Canny(image_gray,image_edge,100,200);
    sensor_msgs::ImagePtr image_edge_msg = cv_bridge::CvImage(std_msgs::Header(),"mono8",image_edge).toImageMsg();
    edge_pub.publish(image_edge_msg);

    //gray and fast and edge in one image
    cv::Mat image_all;
    cv::drawKeypoints(image_gray, keypoints, image_all);
    cv::Mat image_edge_bgr;
    cv::cvtColor(image_edge, image_edge_bgr, cv::COLOR_GRAY2BGR);
    cv::addWeighted(image_all, 1.0, image_edge_bgr, 1.0, 0.0, image_all);
    cv::drawKeypoints(image_all, keypoints, image_all);
    sensor_msgs::ImagePtr image_all_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image_all).toImageMsg();
    all_pub.publish(image_all_msg);

}

int main(int argc,char** argv)
{
    ros::init(argc,argv,"jiegenb");
    ros::NodeHandle nh;
    gray_pub = nh.advertise<sensor_msgs::Image>("/camera/gray/image_raw",10);
    fast_pub = nh.advertise<sensor_msgs::Image>("/camera/fast/image_raw",10);
    edge_pub = nh.advertise<sensor_msgs::Image>("/camera/edge/image_raw",10);
    all_pub = nh.advertise<sensor_msgs::Image>("/camera/all/image_raw",10);
    ros::Subscriber rgb_sub = nh.subscribe("/camera/color/image_raw",1,callback_rgb);
    ros::spin();
    return 0;
}