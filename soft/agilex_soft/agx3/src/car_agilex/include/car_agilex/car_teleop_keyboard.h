#ifndef CAR_TELEOP_KEYBOARD_H_
#define CAR_TELEOP_KEYBOARD_H_

#include <ros/ros.h>

#include "car_agilex/ScoutLightCmd.h"
#include "car_agilex/ScoutMotionCmd.h"

#include <signal.h>
#include <stdio.h>
#include <termios.h>
#include <unistd.h>

class KeyboardReader
{
public:
  KeyboardReader()
    : kfd(0)
  {
    // get the console in raw mode
    tcgetattr(kfd, &cooked);
    memcpy(&raw, &cooked, sizeof(struct termios));
    raw.c_lflag &=~ (ICANON | ECHO);
    // Setting a new line, then end of file
    raw.c_cc[VEOL] = 1;
    raw.c_cc[VEOF] = 2;
    tcsetattr(kfd, TCSANOW, &raw);
  }
  void readOne(char * c)
  {
    // get the console back in raw mode
    tcsetattr(kfd, TCSANOW, &raw);
    int rc = read(kfd, c, 1);
    if (rc < 0)
    {
      throw std::runtime_error("read failed");
    }
    // restore the console to cooked mode
    tcsetattr(kfd, TCSANOW, &cooked);
  }
  void shutdown()
  {
    tcsetattr(kfd, TCSANOW, &cooked);
  }
private:
  int kfd;
  struct termios cooked,raw;
};

class TeleopCar
{
public:
  TeleopCar(ros::NodeHandle nh);
  void keyLoop();
private:
  ros::NodeHandle nh_;
  ros::ServiceClient scout_light_client,scout_motion_client;
  car_agilex::ScoutLightCmd scout_light_cmd;
  car_agilex::ScoutMotionCmd scout_motion_cmd;
  bool ctl_light_position_flag;
};

void quit(int sig);

#endif