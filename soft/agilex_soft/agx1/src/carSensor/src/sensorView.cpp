//class sensorView
#include "carSensor/sensorView.h"

int maxDepth_, minDepth_;

//constructor
sensorView::sensorView(std::string mode)
{
    //init ros node handle
    ros::NodeHandle nh;
    if(mode == "all"){
        subCarVelocity = nh.subscribe("/odom", 10, &sensorView::getCarVelocity, this);
        subCameraImageRGB = nh.subscribe("/camera/color/image_raw", 10, &sensorView::getCameraImageRgb, this);
        subCameraImageDepth = nh.subscribe("/camera/depth/image_rect_raw", 10, &sensorView::getCameraImageDepth, this);
        subLidarData = nh.subscribe("/rslidar_points", 10, &sensorView::getLidarData, this);
        viewer.reset(new pcl::visualization::PCLVisualizer("Lidar Data"));
    }
    else{
        for(int i = 0; i < mode.size(); i++){
            if(mode[i] == '1'){
                subCarVelocity = nh.subscribe("/odom", 10, &sensorView::getCarVelocity, this);
            }
            else if(mode[i] == '2'){
                subCameraImageRGB = nh.subscribe("/camera/color/image_raw", 10, &sensorView::getCameraImageRgb, this);
            }
            else if(mode[i] == '3'){
                subCameraImageDepth = nh.subscribe("/camera/depth/image_rect_raw", 10, &sensorView::getCameraImageDepth, this);
            }
            else if(mode[i] == '4'){
                subLidarData = nh.subscribe("/rslidar_points", 10, &sensorView::getLidarData, this);
                viewer.reset(new pcl::visualization::PCLVisualizer("Lidar Data"));
            }
        }
    }
    
    //init car linear velocity and angular velocity
    carLinearVelocity = 0;
    carAngularVelocity = 0;
}

//destructor
sensorView::~sensorView()
{
}

//get car linear velocity and angular velocity and show them in a new terminal
void sensorView::getCarVelocity(const nav_msgs::Odometry::ConstPtr& msg)
{
    //get car linear velocity and angular velocity
    carLinearVelocity = msg->twist.twist.linear.x;
    carAngularVelocity = msg->twist.twist.angular.z;
    //show car linear velocity and angular velocity
    ROS_INFO("========================================");
    ROS_INFO("Car Velocity:");
    ROS_INFO("Car Linear Velocity: %f", carLinearVelocity);
    ROS_INFO("Car Angular Velocity: %f", carAngularVelocity);
    ROS_INFO("========================================");
}

//get realtime camera rgb image and use opencv to show them realtime
void sensorView::getCameraImageRgb(const sensor_msgs::ImageConstPtr& msgRGB)
{
    //convert ros image to opencv image
    cv_bridge::CvImagePtr cv_ptrRGB;
    try
    {
        cv_ptrRGB = cv_bridge::toCvCopy(msgRGB, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception:%s", e.what());
        return;
    }
    
    //show rgb image
    cv::imshow("RGB Image", cv_ptrRGB->image);
    cv::waitKey(1);
}

//get camera depth image and use opencv to show it with depth RGB color
void sensorView::getCameraImageDepth(const sensor_msgs::ImageConstPtr& msgDepth)
{
    // Convert ROS image to OpenCV image
    cv_bridge::CvImagePtr cv_ptrDepth;
    try
    {
        cv_ptrDepth = cv_bridge::toCvCopy(msgDepth, sensor_msgs::image_encodings::TYPE_32FC1);
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

    // Calculate range based on percentiles of depth values
    cv::Mat depthVec = cv_ptrDepth->image.reshape(1, cv_ptrDepth->image.total());
    cv::Mat depthVecSorted;
    cv::sort(depthVec, depthVecSorted, cv::SORT_ASCENDING);
    int percentileLow = 1;
    int percentileHigh = 99;
    float minDepth = depthVecSorted.at<float>(depthVecSorted.rows * percentileLow / 100);
    float maxDepth = depthVecSorted.at<float>(depthVecSorted.rows * percentileHigh / 100);
    // cout<<"range: ["<<minDepth<<", "<<maxDepth<<"]"<<endl;
    // Check if range is smaller than threshold
    float rangeThreshold_low = 5500,rangeThreshold_high = 6000;
    if (maxDepth - minDepth < rangeThreshold_low || maxDepth - minDepth > rangeThreshold_high)
    {
        // Use fixed range of depth values
        minDepth = minDepth_;
        maxDepth = maxDepth_;
    }

    // Render depth image with depth RGB color
    cv::Mat depthImg8U;
    cv::Mat depthImgColor;
    cv_ptrDepth->image.convertTo(depthImg8U, CV_8UC1, 255.0 / (maxDepth - minDepth), -255.0 * minDepth / (maxDepth - minDepth));
    cv::applyColorMap(depthImg8U, depthImgColor, cv::COLORMAP_RAINBOW);

    std::stringstream ss;
    // ss << "Depth Image:Range: [" << minDepth << ", " << maxDepth << "]";
    // cout<<ss.str()<<endl;
    std::string windowName = ss.str();
    // Show depth image with depth RGB color
    cv::imshow("Depth Image", depthImgColor);
    cv::waitKey(1);

    // //convert ros image to opencv image
    // cv_bridge::CvImagePtr cv_ptrDepth;
    // try
    // {
    //     cv_ptrDepth = cv_bridge::toCvCopy(msgDepth, sensor_msgs::image_encodings::TYPE_32FC1);
    // }
    // catch (cv_bridge::Exception& e)
    // {
    //     ROS_ERROR("cv_bridge exception:%s", e.what());
    //     return;
    // }
    
    // //show depth image
    // cv::imshow("Depth Image", cv_ptrDepth->image);
    // cv::waitKey(1);
}

//get real time lidar data and use pcl to show them realtime
void sensorView::getLidarData(const sensor_msgs::PointCloud2ConstPtr& msg)
{
    //convert ros pointcloud2 to pcl pointcloud
    pcl::PointCloud<pcl::PointXYZI>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::fromROSMsg(*msg, *cloud);
    
    //show lidar data
    viewer->removeAllPointClouds();
    pcl::visualization::PointCloudColorHandlerGenericField<pcl::PointXYZI> fildColor(cloud, "intensity");
    viewer->addPointCloud<pcl::PointXYZI>(cloud, fildColor, "cloud");
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "cloud");
    viewer->setBackgroundColor(0, 0, 0);
    viewer->spinOnce();
}

//main to view all
int main(int argc, char** argv)
{
    //init ros
    ros::init(argc, argv, "sensorView");
    
    //please run with param
    //example:
    //rosrun carSensor sensorView _mode:=~1234
    std::string mode;
    ros::NodeHandle nh("~");
    nh.param<std::string>("mode", mode, "all");
    nh.param<int>("maxDepth", maxDepth_, 30);
    nh.param<int>("minDepth", minDepth_, 9000);
    cout<<"mode: "<<mode<<endl;

    //create sensorView object
    sensorView sensorView(mode);

    //ros spin
    ros::spin();
    
    return 0;
}
