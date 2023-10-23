#include "car_instance.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "car_instance");
    ros::NodeHandle nh;

    CarInstance car_instance(nh);
    car_instance.run();

    return 0;
}