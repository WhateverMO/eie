#!/usr/bin/env python2

import rospy
from sensor_msgs.msg import Imu
import matplotlib.pyplot as plt

# plot 3 figures of acc_x, acc_y, acc_z in one window and update in real time

acc_x_list = []
acc_y_list = []
acc_z_list = []
time_list = []

def plot_acc():
    plt.ion()
    plt.figure(1)
    plt.subplot(311)
    plt.plot(time_list, acc_x_list, 'r-')
    plt.ylabel('acc_x')
    plt.subplot(312)
    plt.plot(time_list, acc_y_list, 'g-')
    plt.ylabel('acc_y')
    plt.subplot(313)
    plt.plot(time_list, acc_z_list, 'b-')
    plt.ylabel('acc_z')
    plt.xlabel('time')
    plt.show()
    plt.pause(0.001)

# plot 3 figures of w_k_x, w_k_y, w_k_z in one window and update in real time

w_k_x_list = []
w_k_y_list = []
w_k_z_list = []

def plot_w_k():
    plt.ion()
    plt.figure(2)
    plt.subplot(311)
    plt.plot(time_list, w_k_x_list, 'r-')
    plt.ylabel('w_k_x')
    plt.subplot(312)
    plt.plot(time_list, w_k_y_list, 'g-')
    plt.ylabel('w_k_y')
    plt.subplot(313)
    plt.plot(time_list, w_k_z_list, 'b-')
    plt.ylabel('w_k_z')
    plt.xlabel('time')
    plt.show()
    plt.pause(0.001)

def callback_acc(msg):
    global acc_x_list, acc_y_list, acc_z_list, time_list, w_k_x_list, w_k_y_list, w_k_z_list
    acc_x, acc_y, acc_z = msg.linear_acceleration.x, msg.linear_acceleration.y, msg.linear_acceleration.z
    w_k_x, w_k_y, w_k_z = msg.angular_velocity.x, msg.angular_velocity.y, msg.angular_velocity.z
    acc_x_list.append(acc_x)
    acc_y_list.append(acc_y)
    acc_z_list.append(acc_z)
    time_list.append(rospy.Time.now().to_sec())
    w_k_x_list.append(w_k_x)
    w_k_y_list.append(w_k_y)
    w_k_z_list.append(w_k_z)
    if len(acc_x_list)%100000 == 0:
        # remain the last 1000 data
        acc_x_list = acc_x_list[-10000:]
        acc_y_list = acc_y_list[-10000:]
        acc_z_list = acc_z_list[-10000:]
        time_list = time_list[-10000:]
        w_k_x_list = w_k_x_list[-10000:]
        w_k_y_list = w_k_y_list[-10000:]
        w_k_z_list = w_k_z_list[-10000:]
    rospy.loginfo("Received: acc_x = %s, acc_y = %s, acc_z = %s", acc_x, acc_y, acc_z)
    rospy.loginfo("Received: w_k_x = %s, w_k_y = %s, w_k_z = %s", w_k_x, w_k_y, w_k_z)
    rospy.loginfo("avg acc_x = %s, avg acc_y = %s, avg acc_z = %s", sum(acc_x_list)/len(acc_x_list), sum(acc_y_list)/len(acc_y_list), sum(acc_z_list)/len(acc_z_list))
    rospy.loginfo("avg w_k_x = %s, avg w_k_y = %s, avg w_k_z = %s", sum(w_k_x_list)/len(w_k_x_list), sum(w_k_y_list)/len(w_k_y_list), sum(w_k_z_list)/len(w_k_z_list))

if __name__ == '__main__':
    rospy.init_node('analyze')
    rospy.loginfo('analyze node started')
    sub = rospy.Subscriber('/imu_kalman', Imu, callback_acc)
    i = 0
    while not rospy.is_shutdown():
        if i%100 == 0:
            plot_acc()
            plot_w_k()
        i += 1
    rospy.spin()