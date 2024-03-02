#include <ros/ros.h>
#include <darknet_ros_msgs/BoundingBoxes.h>
#include <darknet_ros_msgs/BoundingBox.h>
#include <std_msgs/String.h>

ros::Publisher pub;

void callback(const darknet_ros_msgs::BoundingBoxes::ConstPtr& boxes_msg)
{
    for (const auto& box : boxes_msg->bounding_boxes)
    {
        if (box.Class == "A" || box.Class == "B" || box.Class == "C" || box.Class == "D")
        {
            ROS_INFO("Detected %s with probability %f at [%d, %d, %d, %d]",
                     box.Class.c_str(), box.probability, box.xmin, box.ymin, box.xmax, box.ymax);

            std_msgs::String msg;
            msg.data = box.Class;
            pub.publish(msg);
        }
    }
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "yolo");

    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/darknet_ros/bounding_boxes", 1, callback);

    pub = nh.advertise<std_msgs::String>("/recognize", 1);

    ros::spin();

    return 0;
}