/*
*
*
*卡尔曼滤波算法实现
*利用前面时刻的加速度与当前时刻加速度相同作为预测
*传感器当前时刻的测量结果为测量。
*
*/
#include <ros/ros.h>
#include <fstream>
#include "sensor_msgs/Imu.h"
//#include "sensor_msgs/LaserScan.h"
#include "Eigen/Dense"
//#include "sensor_msgs/LaserScan.h"

double a_x;     //x向的加速度
double a_y;     //y方向的加速度
double a_z;     //z方向的加速度


Eigen::MatrixXd X = Eigen::MatrixXd(3,1);   //创建一个3*1矩阵

using namespace std;      //指调用命名空间std内定义的所有标识符。

class kalman_filter     //创建一个类名为kalman_filter的类
{
private:      //行为或属性

    /* data */
    //Eigen::MatrixXd x;   //要处理的状态变量
    Eigen::MatrixXd A;      //系统状态矩阵
    Eigen::MatrixXd P;      //协方差
    Eigen::MatrixXd Q;      //测量过程噪音（预测）
    Eigen::MatrixXd R;      //真实传感器噪音
    Eigen::MatrixXd H;      //测量矩阵
    //Eigen::MatrixXd x = Eigen::MatrixXd(3,1);
    // Eigen::MatrixXd z = Eigen::MatrixXd(3,1);

    bool isinitized = false;    //isinitized判断是否进行了初始化

public:    //行为或属性
    kalman_filter(/* args */);  //构造函数，主要用来在创建对象时初始化对象， 即为对象成员变量赋初始值
    Eigen::MatrixXd predictAndupdate( Eigen::MatrixXd x,Eigen::MatrixXd z);
    //void update();
    ~kalman_filter();  //析构函数
};

// predictAndupdate 函数的实现
Eigen::MatrixXd kalman_filter::predictAndupdate(Eigen::MatrixXd x,Eigen::MatrixXd z)
{
    if(!isinitized)                //如果isinitized为假，则if语句为真
    {
        P = Eigen::MatrixXd(3,3);    //协方差 3*3矩阵
        P<<1,0,0,
                0,1,0,
                0,0,1;             //协方差的初始化
        isinitized=true;
    }
    x = A*x;       // 状态一步预测方程
    P = A*P*(A.transpose())+Q;      //一步预测协方差阵
    Eigen::MatrixXd  K = P*(H.transpose())*((H*P*(H.transpose())+R).inverse());     //kalman增益
    x = x+K*(z-H*x);                //状态更新：
    int x_size = x.size();
    Eigen::MatrixXd I = Eigen::MatrixXd::Identity(x_size, x_size);
    P = (I-K*H)*P;    // 协方差阵更新：
    return x;    //返回值类型 Eigen::MatrixXd
}
// 构造函数的具体实现，
kalman_filter::kalman_filter(/* args */)
{
//参数初始化设置
    A=Eigen::MatrixXd(3,3);   //系统状态矩阵
    A<<1,0,0,
        0,1,0,
        0,0,1;
    H=Eigen::MatrixXd(3,3);   //测量矩阵
    H<<1,0,0,
        0,1,0,
        0,0,1;
    Q=Eigen::MatrixXd(3,3);  //（预测）过程噪音
    Q<<0.03,0,0,
        0,0.03,0,
        0,0,0.03;    //0.1
    R=Eigen::MatrixXd(3,3);  //真实传感器噪音
    R<<3.65,0,0,                    //R太大，卡尔曼滤波响应会变慢
       0,3.65,0,
       0,0,3.65;     //
}
// 构造函数的具体实现，
// kalman_filter::kalman_filter(/* args */)
// {
// //参数初始化设置
//     A=Eigen::MatrixXd(3,3);   //系统状态矩阵
//     A<<1,0,0,
//         0,1,0,
//         0,0,1;
//     H=Eigen::MatrixXd(3,3);   //测量矩阵
//     H<<1,0,0,
//         0,1,0,
//         0,0,1;
//     Q=Eigen::MatrixXd(3,3);  //（预测）过程噪音
//     Q<<0.33,0,0,
//         0,0.33,0,
//         0,0,0.33;    //0.1
//     R=Eigen::MatrixXd(3,3);  //真实传感器噪音
//     R<<2.65,0,0,                    //R太大，卡尔曼滤波响应会变慢
//        0,2.65,0,
//        0,0,2.65;     //
// }
// 构造函数的具体实现，
// kalman_filter::kalman_filter(/* args */)
// {
// //参数初始化设置
//     A=Eigen::MatrixXd(3,3);   //系统状态矩阵
//     A<<1,0,0,
//         0,1,0,
//         0,0,1;
//     H=Eigen::MatrixXd(3,3);   //测量矩阵
//     H<<1,0,0,
//         0,1,0,
//         0,0,1;
//     Q=Eigen::MatrixXd(3,3);  //（预测）过程噪音
//     Q<<20.03,0,0,
//         0,20.03,0,
//         0,0,20.03;    //0.1
//     R=Eigen::MatrixXd(3,3);  //真实传感器噪音
//     R<<0.65,0,0,                    //R太大，卡尔曼滤波响应会变慢
//        0,0.65,0,
//        0,0,0.65;     //
// }

// 析构函数
kalman_filter::~kalman_filter()
{
}


//  创建一个类名为SubscribeAndPublish的类
class SubscribeAndPublish
{
public:
    SubscribeAndPublish()   //成员函数 SubscribeAndPublish
    {
        //Topic you want to publish
        // 订阅来自IMU的数据，imuInfoCallback进行函数处理

          imu_info_sub = n.subscribe("/imu/data_raw", 10, &SubscribeAndPublish::imuInfoCallback,this);

        IMU_kalman_pub = n.advertise<sensor_msgs::Imu>("/imu_kalman", 10);
    }
    void imuInfoCallback(const sensor_msgs::Imu::ConstPtr& msg)
    {
        // 第一次将接收到的消息打印出来


        if(first)   //时执行后续语句
        {
            double a_x_m = msg->linear_acceleration.x;      // 三个方向的线性加速度
            double a_y_m = msg->linear_acceleration.y;
            double a_z_m = msg->linear_acceleration.z;
            X<<a_x_m,a_y_m,a_z_m;         // 用X存第一帧三个方向的线性加速度
            //第一次不用卡尔曼滤波，直接发布出去，
            sensor_msgs::Imu M;
            M.linear_acceleration.x = a_x_m;
            M.linear_acceleration.y = a_y_m;
            M.linear_acceleration.z = a_z_m;
            M.header = msg->header;
            IMU_kalman_pub.publish(M);
            first=false;
            cout<< "first farm"<< endl;
        }
        else
        {
            /* code */
            double a_x_m = msg->linear_acceleration.x;
            double a_y_m = msg->linear_acceleration.y;
            double a_z_m = msg->linear_acceleration.z;
            Eigen::MatrixXd z;
            z = Eigen::MatrixXd(3,1);
            z<<a_x_m,a_y_m,a_z_m;
            kalman_filter kf;   //kalman_filter 创建的对象kf
            Eigen::MatrixXd x_new = kf.predictAndupdate(X,z);      // z当前时刻的量测值，X
            X = z;     //一时刻的量测，进行模型更新用的?

            // 整理成适合话题发布的形式
            a_x = x_new(0,0);
            a_y = x_new(1,0);
            a_z = x_new(2,0);
            sensor_msgs::Imu M;
            M.linear_acceleration.x = a_x;
            M.linear_acceleration.y = a_y;
            M.linear_acceleration.z = a_z;
            M.header = msg->header;
            std::ofstream output;



            cout<< "linear_acceleration.x = " << a_x <<"linear_acceleration.y = " << a_y <<"linear_acceleration.z = " << a_z << endl;
            IMU_kalman_pub.publish(M);
        }
    }
private:
    ros::NodeHandle n;
    ros::Publisher IMU_kalman_pub;    // 创建一个发布者
    ros::Subscriber imu_info_sub;     // 创建一个接收者
    bool first=true;
};//End of class SubscribeAndPublish

int main(int argc, char **argv)
{
    //Initiate ROS
    ros::init(argc, argv, "subscribe_and_publish");

    //Create an object of class SubscribeAndPublish that will take care of everything
    SubscribeAndPublish SAPObject;

    ros::spin();

    return 0;
}

