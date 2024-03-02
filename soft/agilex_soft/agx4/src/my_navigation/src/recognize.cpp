#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <std_msgs/String.h>
#include <vector>
#include <unistd.h>

// 定义字母模板
std::vector<std::vector<cv::Point>> templates;

ros::Publisher pub,pub_img;

int sameTimes = 0, lastLetter = -1;

#define MAXsameTimes 10
#define min_detection_area 150
#define max_detection_area 405

// 读取外部模板图像，并将其转换为轮廓模板
std::vector<cv::Point> readTemplate(const std::string& filename)
{
    // 读取图像
    cv::Mat image = cv::imread(filename, cv::IMREAD_GRAYSCALE);

    // 对图像进行二值化处理
    cv::Mat binary;
    cv::threshold(image, binary, 0, 255, cv::THRESH_BINARY_INV | cv::THRESH_OTSU);

    // 查找轮廓
    std::vector<std::vector<cv::Point>> contours;
    cv::findContours(binary, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

    // 返回第一个轮廓
    return contours[0];
}

// 定义图像处理函数
void processImage(const sensor_msgs::ImageConstPtr& msg)
{
    // 将ROS图像消息转换为OpenCV图像格式
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
        cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

    // 将图像转换为灰度图像
    cv::Mat gray;
    cv::cvtColor(cv_ptr->image, gray, cv::COLOR_BGR2GRAY);

    // 对灰度图像进行二值化处理
    cv::Mat binary;
    cv::threshold(gray, binary, 0, 255, cv::THRESH_BINARY_INV | cv::THRESH_OTSU);

    // 查找轮廓
    std::vector<std::vector<cv::Point>> contours;
    cv::findContours(binary, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

    // 遍历轮廓，查找ABCD字母
    for (const auto& contour : contours)
    {
        // 计算轮廓的矩形边界框
        cv::Rect rect = cv::boundingRect(contour);

        // 如果矩形边界框太小，则忽略该轮廓
        if (rect.width < min_detection_area || rect.height < min_detection_area)
        {
            continue;
        }

        // 如果矩形边界框太大，则忽略该轮廓
        if (rect.width > max_detection_area || rect.height > max_detection_area)
        {
            continue;
        }

        // 提取矩形边界框内的图像
        cv::Mat roi = cv_ptr->image(rect);

        // 将图像转换为灰度图像
        cv::cvtColor(roi, gray, cv::COLOR_BGR2GRAY);

        // 对灰度图像进行二值化处理
        cv::threshold(gray, binary, 0, 255, cv::THRESH_BINARY_INV | cv::THRESH_OTSU);

        // 计算轮廓
        std::vector<std::vector<cv::Point>> roi_contours;
        cv::findContours(binary, roi_contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

        // 如果轮廓数量为1，则认为该矩形框内包含一个字母
        if (roi_contours.size() == 1)
        {
            // 计算轮廓的矩形边界框
            cv::Rect roi_rect = cv::boundingRect(roi_contours[0]);

            // 匹配字母模板
            double min_distance = std::numeric_limits<double>::max();
            double distance;
            int min_index = -1;
            for (int i = 0; i < templates.size(); i++)
            {
                distance = cv::matchShapes(roi_contours[0], templates[i], CV_CONTOURS_MATCH_I1, 0.09);
                if (distance < min_distance)
                {
                    // 匹配已经匹配到的矩形区域中的更小的中心矩形区域（面积1/4）TODO
                    min_distance = distance;
                    min_index = i;
                }
            }

            // 绘制矩形框且在轮廓左上角和左下角显示字母和当前轮廓长宽
            std::string text = std::string(1, 'A' + min_index)+ " at (" + std::to_string(rect.x) + "," + std::to_string(rect.y) +
             ") size(" + std::to_string(roi_rect.width) + "," + std::to_string(roi_rect.height)+")";
            cv::rectangle(cv_ptr->image, rect, cv::Scalar(0, 255, 0), 2);
            cv::putText(cv_ptr->image, text, rect.tl(), cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 255, 0), 2);
            cv::putText(cv_ptr->image, text, rect.br(), cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 255, 0), 2);

            // 显示识别结果
            if (min_index >= 0 && min_index < templates.size())
            {
                char letter = 'A' + min_index;
                ROS_INFO("Found letter %c at (%d, %d) distance = (%f,%f)", letter, rect.x, rect.y, min_distance, distance);
                if (lastLetter == min_index)
                {
                    sameTimes++;
                    if (sameTimes >= MAXsameTimes)
                    {
                        std_msgs::String msg;
                        msg.data = std::string(1, letter);
                        pub.publish(msg);
                        sameTimes = 0;
                        lastLetter = -1;
                    }
                }
                else
                {
                    sameTimes = 0;
                    lastLetter = min_index;
                }
            }
        }
    }

    // 将OpenCV图像格式转换为ROS图像消息并发布
    pub_img.publish(cv_ptr->toImageMsg());

    // 显示图像
    // cv::imshow("image", cv_ptr->image);
    // cv::waitKey(1);
}

int main(int argc, char** argv)
{
    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) != NULL)
    {
        std::cout << "Current working directory: " << cwd << std::endl;
    }
    else
    {
        std::cerr << "Error: Unable to get current working directory" << std::endl;
        return 1;
    }
    // 创建ROS节点
    ros::init(argc, argv, "recognize");

    // 读取外部模板图像，并将其转换为轮廓模板
    std::vector<std::vector<cv::Point>> templates_ = {
        readTemplate("src/my_navigation/img/A.jpg"),
        readTemplate("src/my_navigation/img/B.jpg"),
        readTemplate("src/my_navigation/img/C.jpg"),
        readTemplate("src/my_navigation/img/D.jpg")
    };

    templates = templates_;

    // 创建ROS节点句柄
    ros::NodeHandle nh;

    // 订阅图像话题
    ros::Subscriber sub = nh.subscribe("/camera/color/image_raw", 1, processImage);

    // 创建一个Publisher，发布识别结果
    pub = nh.advertise<std_msgs::String>("/recognize", 1);

    // 创建一个Publisher，发布识别结果
    pub_img = nh.advertise<sensor_msgs::Image>("/recognize_img", 1);

    // 运行ROS节点
    ros::spin();

    return 0;
}