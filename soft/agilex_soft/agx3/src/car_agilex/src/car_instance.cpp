#include "car_instance.h"

CarInstance::CarInstance(ros::NodeHandle nh,std::string device_name, int baudrate)
{
    scout_.Connect(device_name, baudrate);
    scout_.EnableCommandedMode();
    ROS_INFO("Scout MINI connected.");
    nh_ = nh;

    time_now = time_last = 0;

    // imu_x = imu_y = imu_z = imu2_x = imu2_y = imu2_z = odom_x = odom_y = odom_z = odom2_x = odom2_y = odom2_z = 0;
    // imu_points.header.frame_id = imu_strip.header.frame_id = imu_list.header.frame_id = "map";
    // imu_points.header.stamp = imu_strip.header.stamp = imu_list.header.stamp = ros::Time::now();
    // imu_points.ns = imu_strip.ns = imu_list.ns = "imu_marker";
    // imu_points.action = imu_strip.action = imu_list.action = visualization_msgs::Marker::ADD;
    // imu_points.pose.orientation.w = imu_strip.pose.orientation.w = imu_list.pose.orientation.w = 1.0;
    // imu_points.id = 0;
    // imu_strip.id = 1;
    // imu_list.id = 2;
    // imu_points.type = visualization_msgs::Marker::POINTS;
    // imu_strip.type = visualization_msgs::Marker::LINE_STRIP;
    // imu_list.type = visualization_msgs::Marker::LINE_LIST;
    // imu_points.scale.x = 0.2;
    // imu_points.scale.y = 0.2;
    // imu_strip.scale.x = 0.1;
    // imu_list.scale.x = 0.1;
    // imu_points.color.g = 1.0f;
    // imu_points.color.a = 1.0;
    // imu_strip.color.b = 1.0;
    // imu_strip.color.a = 1.0;
    // imu_list.color.r = 1.0;
    // imu_list.color.a = 1.0;
    odom_points.header.frame_id = odom_strip.header.frame_id = odom_list.header.frame_id = "map";
    odom_points.header.stamp = odom_strip.header.stamp = odom_list.header.stamp = ros::Time::now();
    odom_points.ns = odom_strip.ns = odom_list.ns = "odom_marker";
    odom_points.action = odom_strip.action = odom_list.action = visualization_msgs::Marker::ADD;
    odom_points.pose.orientation.w = odom_strip.pose.orientation.w = odom_list.pose.orientation.w = 1.0;
    odom_points.id = 0;
    odom_strip.id = 1;
    odom_list.id = 2;
    odom_points.type = visualization_msgs::Marker::POINTS;
    odom_strip.type = visualization_msgs::Marker::LINE_STRIP;
    odom_list.type = visualization_msgs::Marker::LINE_LIST;
    odom_points.scale.x = 0.2;
    odom_points.scale.y = 0.2;
    odom_strip.scale.x = 0.1;
    odom_list.scale.x = 0.1;
    odom_points.color.g = 1.0f;
    odom_points.color.a = 1.0;
    odom_strip.color.b = 1.0;
    odom_strip.color.a = 1.0;
    odom_list.color.r = 1.0;
    odom_list.color.a = 1.0;

    odom_x_last = odom_y_last = odom_z_last = 0;

    scout_state_pub_ = nh_.advertise<car_agilex::ScoutState>(topic_name, 10);
    // marker_pub_imu_ = nh_.advertise<visualization_msgs::Marker>("imu_marker", 10);
    marker_pub_odom_ = nh_.advertise<visualization_msgs::Marker>("odom_marker", 10);
    // imu_sub_ = nh_.subscribe("imu/data_raw", 10, &CarInstance::scoutMarkerPublishImu, this);
    odom_sub_ = nh_.subscribe("odom", 10, &CarInstance::scoutMarkerPublishOdom, this);
    scout_light_srv_ = nh_.advertiseService(service_name_light, &CarInstance::scoutLightCallback, this);
    scout_motion_srv_ = nh_.advertiseService(service_name_motion, &CarInstance::scoutMotionCallback, this);
}

CarInstance::~CarInstance()
{
    scout_.Disconnect();
    ROS_INFO("Scout MINI disconnected.");
}

void CarInstance::run()
{
    ros::Rate loop_rate(ROS_RATE);
    while (ros::ok())
    {
        scoutStatePublish();
        ros::spinOnce();
        loop_rate.sleep();
    }
}

bool first_flag = true;

void CarInstance::scoutMarkerPublishOdom(const nav_msgs::Odometry::ConstPtr &msg)
{
    odom_x = msg->pose.pose.position.x;
    odom_y = msg->pose.pose.position.y;
    odom_z = msg->pose.pose.position.z;
    odom2_x = odom_x;
    odom2_y = odom_y;
    odom2_z = odom_z + vector_length;

    geometry_msgs::Point p;
    p.x = odom_x;
    p.y = odom_y;
    p.z = odom_z;

    double distance = (odom_x-odom_x_last)*(odom_x-odom_x_last)+(odom_y-odom_y_last)*(odom_y-odom_y_last)+(odom_z-odom_z_last)*(odom_z-odom_z_last);
    if(distance>max_distance || first_flag)
    {
        odom_points.points.push_back(p);
        odom_strip.points.push_back(p);
        odom_list.points.push_back(p);
        p.x = odom2_x;
        p.y = odom2_y;
        p.z = odom2_z;
        odom_list.points.push_back(p);

        marker_pub_odom_.publish(odom_points);
        marker_pub_odom_.publish(odom_strip);
        marker_pub_odom_.publish(odom_list);

        odom_x_last = odom_x;
        odom_y_last = odom_y;
        odom_z_last = odom_z;
        first_flag = false;
    }
}

//基于加速度计和陀螺仪数据的姿态和位置估计算法
// int imuRecivedNumber = 0;

// void CarInstance::scoutMarkerPublishImu(const sensor_msgs::Imu::ConstPtr &msg)
// {
//     if(imuRecivedNumber == 0){
//         imu_av_x = msg->angular_velocity.x;
//         imu_av_y = msg->angular_velocity.y;
//         imu_av_z = msg->angular_velocity.z;
//         imu_lv_x = msg->linear_acceleration.x;
//         imu_lv_y = msg->linear_acceleration.y;
//         imu_lv_z = msg->linear_acceleration.z;
//         imuRecivedNumber++;
//     }else{
//         double dt = 0;
//         time_now = msg->header.stamp.toSec();
//         if (time_last == 0)
//         {
//             time_last = time_now;
//         }
//         else
//         {
//             dt = time_now - time_last;
//             time_last = time_now;
//         }

//         imu_x += 
//         //point imu to point imu2 this vector is the direction of car and the vector length is vector_length
//         imu2_x = imu_x + vector_length * msg->orientation.x;
//         imu2_y = imu_y + vector_length * msg->orientation.y;
//         imu2_z = imu_z + vector_length * msg->orientation.z;

//         geometry_msgs::Point p;
//         p.x = imu_x;
//         p.y = imu_y;
//         p.z = imu_z;
        
//         if((imu_x-imu_x_last)*(imu_x-imu_x_last)+(imu_y-imu_y_last)*(imu_y-imu_y_last)+(imu_z-imu_z_last)*(imu_z-imu_z_last)<max_distance)
//         {
//             imu_points.points.push_back(p);
//             imu_strip.points.push_back(p);
//             imu_list.points.push_back(p);
//             p.x = imu2_x;
//             p.y = imu2_y;
//             p.z = imu2_z;
//             imu_list.points.push_back(p);

//             marker_pub_imu_.publish(imu_points);
//             marker_pub_imu_.publish(imu_strip);
//             marker_pub_imu_.publish(imu_list);

//             imu2_x_last = imu2_x;
//             imu2_y_last = imu2_y;
//             imu2_z_last = imu2_z;
//         }
//     }
// }

void CarInstance::scoutStatePublish()
{
    westonrobot::ScoutState state = scout_.GetScoutState();
    car_agilex::ScoutState scout_state_msg;

    scout_state_msg.base_state = state.base_state;
    scout_state_msg.control_mode = state.control_mode;
    scout_state_msg.fault_code = state.fault_code;
    scout_state_msg.battery_voltage = state.battery_voltage;

    scout_state_msg.actuator_states.resize(motor_num);

    for (int i = 0; i < motor_num; i++)
    {
        scout_state_msg.actuator_states[i].motor_current = state.actuator_states[i].motor_current;
        scout_state_msg.actuator_states[i].motor_rpm = state.actuator_states[i].motor_rpm;
        scout_state_msg.actuator_states[i].motor_pulses = state.actuator_states[i].motor_pulses;
        scout_state_msg.actuator_states[i].motor_temperature = state.actuator_states[i].motor_temperature;

        scout_state_msg.actuator_states[i].driver_voltage = state.actuator_states[i].driver_voltage;
        scout_state_msg.actuator_states[i].driver_temperature = state.actuator_states[i].driver_temperature;
        scout_state_msg.actuator_states[i].driver_state = state.actuator_states[i].driver_state;
    }

    scout_state_msg.front_light_state.mode = state.front_light_state.mode;
    scout_state_msg.front_light_state.custom_value = state.front_light_state.custom_value;
    scout_state_msg.rear_light_state.mode = state.rear_light_state.mode;
    scout_state_msg.rear_light_state.custom_value = state.rear_light_state.custom_value;

    scout_state_msg.linear_velocity = state.linear_velocity;
    scout_state_msg.angular_velocity = state.angular_velocity;

    scout_state_msg.left_odometry = state.left_odometry;
    scout_state_msg.right_odometry = state.right_odometry;

    scout_state_pub_.publish(scout_state_msg);
}

bool CarInstance::scoutLightCallback(car_agilex::ScoutLightCmd::Request &req, car_agilex::ScoutLightCmd::Response &res)
{
    westonrobot::ScoutLightCmd cmd;
    cmd.enable_ctrl = req.enable_ctrl;
    cmd.front_mode = static_cast<westonrobot::ScoutLightCmd::LightMode>(req.front_mode);
    cmd.front_custom_value = req.front_custom_value;
    cmd.rear_mode = static_cast<westonrobot::ScoutLightCmd::LightMode>(req.rear_mode);
    cmd.rear_custom_value = req.rear_custom_value;

    scout_.SetLightCommand(cmd);

    ROS_INFO("Light command received. Front: [%d, %d]; Rear: [%d, %d]",
             cmd.front_mode, cmd.front_custom_value, cmd.rear_mode, cmd.rear_custom_value);

    return true;
}

bool CarInstance::scoutMotionCallback(car_agilex::ScoutMotionCmd::Request &req, car_agilex::ScoutMotionCmd::Response &res)
{
    scout_.SetMotionCommand(req.linear_velocity, req.angular_velocity);

    ROS_INFO("Motion command received. Linear: %f; Angular: %f", req.linear_velocity, req.angular_velocity);

    return true;
}