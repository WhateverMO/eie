#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <tf/transform_datatypes.h>
#include <tf/tf.h>
#include <nav_msgs/Path.h>

using namespace std;

ros::Publisher pose_pub,acc_pub;

int imu_init_state = 0;

#define IMU_INIT 1000
#define IMU_RUN 4000

// time stamp
double time_k,time_k_1,dt;
// gravity
const tf::Vector3 gravity(0,0,9.81);

tf::Vector3 acc_b_k,acc_b_k_1,bias_a_k,avg_acc_k;
tf::Vector3 w_b_k,w_b_k_1,bias_g_k,avg_w_k;

// k+1 means the current time step, k means the previous time step
// acc means acceleration, w means angular velocity, b means bias
tf::Vector3 acc_k_1;
tf::Vector3 w_k_1;

// velo means velocity, pos means position, q means quaternion
tf::Vector3 velo_k,velo_k_1;
tf::Vector3 pos_k,pos_k_1;
tf::Quaternion q_k,q_k_1;

nav_msgs::Path path;

void publish_pose(tf::Vector3 pos_k_,tf::Quaternion q_k_)
{
    geometry_msgs::PoseStamped pose;
    pose.header.stamp = ros::Time::now();
    pose.header.frame_id = "map";
    pose.pose.position.x = pos_k_.getX();
    pose.pose.position.y = pos_k_.getY();
    pose.pose.position.z = pos_k_.getZ();
    pose.pose.orientation.x = q_k_.getX();
    pose.pose.orientation.y = q_k_.getY();
    pose.pose.orientation.z = q_k_.getZ();
    pose.pose.orientation.w = q_k_.getW();
    path.header.stamp = ros::Time::now();
    path.header.frame_id = "map";
    path.poses.push_back(pose);
    pose_pub.publish(path);
}

void publish_acc_w_k(tf::Vector3 acc_k_,tf::Vector3 w_k_)
{
    sensor_msgs::Imu imu;
    imu.header.stamp = ros::Time::now();
    imu.header.frame_id = "map";
    imu.linear_acceleration.x = acc_k_.getX();
    imu.linear_acceleration.y = acc_k_.getY();
    imu.linear_acceleration.z = acc_k_.getZ();
    imu.angular_velocity.x = w_k_.getX();
    imu.angular_velocity.y = w_k_.getY();
    imu.angular_velocity.z = w_k_.getZ();
    acc_pub.publish(imu);
}

void imu_callback(const sensor_msgs::Imu::ConstPtr& msg)
{
    if(imu_init_state <= IMU_INIT)
    {
        time_k = msg->header.stamp.toSec();
        acc_b_k = tf::Vector3(msg->linear_acceleration.x,msg->linear_acceleration.y,msg->linear_acceleration.z);
        w_b_k = tf::Vector3(msg->angular_velocity.x,msg->angular_velocity.y,msg->angular_velocity.z);
        velo_k = tf::Vector3(0,0,0);
        pos_k = tf::Vector3(0,0,0);
        q_k = tf::Quaternion(0,0,0,1);
        bias_a_k = tf::Vector3(0,0,0);
        bias_g_k = tf::Vector3(0,0,0);
        avg_acc_k = tf::Vector3(0,0,0);
        avg_w_k = tf::Vector3(0,0,0);
        publish_pose(pos_k,q_k);
    }else{
        acc_b_k_1 = tf::Vector3(msg->linear_acceleration.x,msg->linear_acceleration.y,msg->linear_acceleration.z);
        w_b_k_1 = tf::Vector3(msg->angular_velocity.x,msg->angular_velocity.y,msg->angular_velocity.z);
        time_k_1 = msg->header.stamp.toSec();
        dt = time_k_1 - time_k;
        // calculate the current angular velocity
        w_k_1 = (w_b_k - bias_g_k + w_b_k_1 - bias_g_k)/2;
        // calculate the current dw
        tf::Vector3 dw;
        dw.setX(w_k_1.getX()*dt);
        dw.setY(w_k_1.getY()*dt);
        dw.setZ(w_k_1.getZ()*dt);
        dw.setW(1);
        // calculate the current qk
        q_k_1 = q_k*dw;
        // calculate the current acceleration
        acc_k_1 = ((acc_b_k-bias_a_k).rotate(q_k.getAxis(),q_k.getAngle()) + gravity + (acc_b_k_1-bias_a_k).rotate(q_k_1.getAxis(),q_k_1.getAngle()) + gravity)/2;
        // publish the current acceleration
        publish_acc_w_k(acc_k_1,w_k_1);
        if(imu_init_state <= IMU_RUN){
            // [INFO] [1698141717.265343]: avg acc_x = 0.0423454155275, avg acc_y = 0.136038176175, avg acc_z = -0.0354032465254
            // [INFO] [1698141717.303511]: avg w_k_x = 5.67689102903e-07, avg w_k_y = -9.52032099063e-06, avg w_k_z = 2.41862308113e-06
            avg_acc_k += acc_k_1;
            avg_w_k += w_k_1;
            if(imu_init_state == IMU_RUN){
                avg_acc_k /= (IMU_RUN-IMU_INIT);
                avg_w_k /= (IMU_RUN-IMU_INIT);
                // avg_acc_k.setX(0.0423454155275);
                // avg_acc_k.setY(0.136038176175);
                // avg_acc_k.setZ(-0.0354032465254);
                // avg_w_k.setX(5.67689102903e-07);
                // avg_w_k.setY(-9.52032099063e-06);
                // avg_w_k.setZ(2.41862308113e-06);
                avg_acc_k.setX(0.3*avg_acc_k.getX()+0.7*0.0423454155275);
                avg_acc_k.setY(0.3*avg_acc_k.getY()+0.7*0.136038176175);
                avg_acc_k.setZ(0.3*avg_acc_k.getZ()+0.7*-0.0354032465254);
                avg_w_k.setX(0.3*avg_w_k.getX()+0.7*5.67689102903e-07);
                avg_w_k.setY(0.3*avg_w_k.getY()+0.7*-9.52032099063e-06);
                avg_w_k.setZ(0.3*avg_w_k.getZ()+0.7*2.41862308113e-06);
                bias_a_k = avg_acc_k;
                bias_g_k = avg_w_k;
                ROS_INFO("bias_a_k: %f %f %f",bias_a_k.getX(),bias_a_k.getY(),bias_a_k.getZ());
                ROS_INFO("bias_g_k: %f %f %f",bias_g_k.getX(),bias_g_k.getY(),bias_g_k.getZ());
            }
            ROS_INFO("imu_init_state: %d PLEASE waiting it bigger to %d",imu_init_state,IMU_RUN);
        }else{
            // calculate the current velocity
            //round the acc_k_1 to 0.01
            tf::Vector3 acc_k_1_round;
            acc_k_1_round.setX(round(acc_k_1.getX()*10)/10);
            acc_k_1_round.setY(round(acc_k_1.getY()*10)/10);
            acc_k_1_round.setZ(round(acc_k_1.getZ()*10)/10);
            velo_k_1 = velo_k + acc_k_1_round*dt;
            // calculate the current position
            //round the velo_k_1 to 0.01
            tf::Vector3 velo_k_1_round;
            velo_k_1_round.setX(round(velo_k_1.getX()*100)/100);
            velo_k_1_round.setY(round(velo_k_1.getY()*100)/100);
            velo_k_1_round.setZ(round(velo_k_1.getZ()*100)/100);
            pos_k_1 = pos_k + velo_k_1_round*dt + acc_k_1*dt*dt/2;
            // publish the current pose
            publish_pose(pos_k_1,q_k_1);
            ROS_INFO("pos_k_1: %f %f %f dt: %f",pos_k_1.getX(),pos_k_1.getY(),pos_k_1.getZ(),dt);
            ROS_INFO("acc_k_1: %f %f %f",acc_k_1.getX(),acc_k_1.getY(),acc_k_1.getZ());
            // ROS_INFO("acc_q_k_1: %f %f %f",acc_b_k.rotate(q_k.getAxis(),q_k.getAngle()).getX(),acc_b_k.rotate(q_k.getAxis(),q_k.getAngle()).getY(),acc_b_k.rotate(q_k.getAxis(),q_k.getAngle()).getZ());
            ROS_INFO("velo_k_1: %f %f %f",velo_k_1.getX(),velo_k_1.getY(),velo_k_1.getZ());
            // ROS_INFO("q_k_1: %f %f %f %f",q_k_1.getX(),q_k_1.getY(),q_k_1.getZ(),q_k_1.getW());
            ROS_INFO("bias_a_k: %f %f %f",bias_a_k.getX(),bias_a_k.getY(),bias_a_k.getZ());
            ROS_INFO("bias_g_k: %f %f %f",bias_g_k.getX(),bias_g_k.getY(),bias_g_k.getZ());
        }
        // update the previous data
            time_k = time_k_1;
            acc_b_k = acc_b_k_1;
            w_b_k = w_b_k_1;
            velo_k = velo_k_1;
            pos_k = pos_k_1;
            q_k = q_k_1;
    }
    imu_init_state++;
}

int main(int argc, char** argv)
{
    ros::init(argc,argv,"imu_pose");
    ros::NodeHandle nh;
    ros::Subscriber imu_sub = nh.subscribe("/imu_kalman",50,imu_callback);
    pose_pub = nh.advertise<nav_msgs::Path>("/imu_pose",100);
    acc_pub = nh.advertise<sensor_msgs::Imu>("/imu_world",100);
    ros::spin();
    return 0;
}  