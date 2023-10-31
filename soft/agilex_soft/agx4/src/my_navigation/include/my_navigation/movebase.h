#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>

class movebase
{
public:
    movebase(ros::NodeHandle &nh);
    ~movebase();
    void processImage(const sensor_msgs::ImageConstPtr& msg);
    void movebase_init();
    void movebase_goal();
    void movebase_start_pose();
    void movebase_pub_start_pose();
    void movebase_pub_goal();
    void movebase_send_goal();
    void movebase_wait_for_result();
    void movebase_shutdown();
}