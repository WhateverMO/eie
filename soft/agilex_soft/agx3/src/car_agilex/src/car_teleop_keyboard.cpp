#include "car_teleop_keyboard.h"

KeyboardReader input;

TeleopCar::TeleopCar(ros::NodeHandle nh)
  : nh_(nh),ctl_light_position_flag(true)
{
    scout_light_client = nh_.serviceClient<car_agilex::ScoutLightCmd>("scout_light_cmd");
    scout_motion_client = nh_.serviceClient<car_agilex::ScoutMotionCmd>("scout_motion_cmd");
    scout_light_cmd.request.enable_ctrl = false;
    scout_light_cmd.request.front_mode = 0;
    scout_light_cmd.request.front_custom_value = 0;
    scout_light_cmd.request.rear_mode = 0;
    scout_light_cmd.request.rear_custom_value = 0;
}

void TeleopCar::keyLoop(){
    char c;
    bool dirty=false;

    puts("Reading from keyboard");
    puts("---------------------------");
    puts("Use arrow keys and wasdqexzc to move the car. Use 0123-=[] to control the light. '/' to quit.");

    for(;;){
        // get the next event from the keyboard  
        try
        {
            input.readOne(&c);
        }
        catch (const std::runtime_error &)
        {
            perror("read():");
            return;
        }

        switch (c)
        {
        case 'w':
            scout_motion_cmd.request.linear_velocity = 0.5;
            scout_motion_cmd.request.angular_velocity = 0;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed w and car is moving forward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 's':
            scout_motion_cmd.request.linear_velocity = -0.5;
            scout_motion_cmd.request.angular_velocity = 0;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed s and car is moving backward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'a':
            scout_motion_cmd.request.linear_velocity = 0;
            scout_motion_cmd.request.angular_velocity = 0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed a and car is turning left");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'd':
            scout_motion_cmd.request.linear_velocity = 0;
            scout_motion_cmd.request.angular_velocity = -0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed d and car is turning right");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'q':
            scout_motion_cmd.request.linear_velocity = 0.5;
            scout_motion_cmd.request.angular_velocity = 0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed q and car is turning left and moving forward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'e':
            scout_motion_cmd.request.linear_velocity = 0.5;
            scout_motion_cmd.request.angular_velocity = -0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed e and car is turning right and moving forward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'x':
            scout_motion_cmd.request.linear_velocity = 0;
            scout_motion_cmd.request.angular_velocity = 0;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed x and car is stoping");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'z':
            scout_motion_cmd.request.linear_velocity = -0.5;
            scout_motion_cmd.request.angular_velocity = -0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed z and car is turning left and moving backward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 'c':
            scout_motion_cmd.request.linear_velocity = -0.5;
            scout_motion_cmd.request.angular_velocity = 0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed c and car is turning right and moving backward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        //arrow key
        case 0x41:
            scout_motion_cmd.request.linear_velocity = 0.5;
            scout_motion_cmd.request.angular_velocity = 0;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed up arrow key and car is moving forward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 0x42:
            scout_motion_cmd.request.linear_velocity = -0.5;
            scout_motion_cmd.request.angular_velocity = 0;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed down arrow key and car is moving backward");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 0x43:
            scout_motion_cmd.request.linear_velocity = 0;
            scout_motion_cmd.request.angular_velocity = -0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed right arrow key and car is turning right");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case 0x44:
            scout_motion_cmd.request.linear_velocity = 0;
            scout_motion_cmd.request.angular_velocity = 0.5;
            scout_motion_client.call(scout_motion_cmd);
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed left arrow key and car is turning left");
            ROS_INFO("linear_velocity:%f, angular_velocity:%f", scout_motion_cmd.request.linear_velocity, scout_motion_cmd.request.angular_velocity);
            ROS_INFO("===============================================================================");
            break;
        case '\\':
            if(scout_light_cmd.request.enable_ctrl){
                scout_light_cmd.request.enable_ctrl = false;
                scout_light_client.call(scout_light_cmd);
            }else{
                scout_light_cmd.request.enable_ctrl = true;
                scout_light_client.call(scout_light_cmd);
            }
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed \\ and light control is %s", scout_light_cmd.request.enable_ctrl ? "enable" : "disable");
            ROS_INFO("===============================================================================");
            break;
        case '[':
            if(scout_light_cmd.request.enable_ctrl){
                ctl_light_position_flag = true;
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed [ and control front light");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed [ and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case ']':
            if(scout_light_cmd.request.enable_ctrl){
                ctl_light_position_flag = false;
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed ] and control rear light");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed ] and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '0':
            if(scout_light_cmd.request.enable_ctrl){
                if(ctl_light_position_flag){
                    scout_light_cmd.request.front_mode = 0;
                    scout_light_cmd.request.front_custom_value = 0;
                }else{
                    scout_light_cmd.request.rear_mode = 0;
                    scout_light_cmd.request.rear_custom_value = 0;
                }
                scout_light_client.call(scout_light_cmd);
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 0 and light mode is off");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 0 and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '1':
            if(scout_light_cmd.request.enable_ctrl){
                if(ctl_light_position_flag){
                    scout_light_cmd.request.front_mode = 1;
                    if(scout_light_cmd.request.front_custom_value == 0)
                        scout_light_cmd.request.front_custom_value = 50;
                }else{
                    scout_light_cmd.request.rear_mode = 1;
                    if(scout_light_cmd.request.rear_custom_value == 0)
                        scout_light_cmd.request.rear_custom_value = 50;
                }
                scout_light_client.call(scout_light_cmd);
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 1 and light mode is always on");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 1 and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '2':
            if(scout_light_cmd.request.enable_ctrl){
                if(ctl_light_position_flag){
                    scout_light_cmd.request.front_mode = 2;
                    if(scout_light_cmd.request.front_custom_value == 0)
                        scout_light_cmd.request.front_custom_value = 50;
                }else{
                    scout_light_cmd.request.rear_mode = 2;
                    if(scout_light_cmd.request.rear_custom_value == 0)
                        scout_light_cmd.request.rear_custom_value = 50;
                }
                scout_light_client.call(scout_light_cmd);
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 2 and light mode is breathing");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 2 and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '3':
            if(scout_light_cmd.request.enable_ctrl){
                if(ctl_light_position_flag){
                    scout_light_cmd.request.front_mode = 3;
                    if(scout_light_cmd.request.front_custom_value == 0)
                        scout_light_cmd.request.front_custom_value = 50;
                }else{
                    scout_light_cmd.request.rear_mode = 3;
                    if(scout_light_cmd.request.rear_custom_value == 0)
                        scout_light_cmd.request.rear_custom_value = 50;
                }
                scout_light_client.call(scout_light_cmd);
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 3 and light mode is custom value");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed 3 and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '-':
            if(scout_light_cmd.request.enable_ctrl){
                if(ctl_light_position_flag){
                    scout_light_cmd.request.front_custom_value -= 1;
                }else{
                    scout_light_cmd.request.rear_custom_value -= 1;
                }
                scout_light_client.call(scout_light_cmd);
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed - and light custom value is decreased");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed - and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '=':
            if(scout_light_cmd.request.enable_ctrl){
                if(ctl_light_position_flag){
                    scout_light_cmd.request.front_custom_value += 1;
                }else{
                    scout_light_cmd.request.rear_custom_value += 1;
                }
                scout_light_client.call(scout_light_cmd);
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed = and light custom value is increased");
                ROS_INFO("===============================================================================");
            }else{
                ROS_INFO("===============================================================================");
                ROS_INFO("pressed = and light control is disable;!!! you need to press \\ to enable light control!!!");
                ROS_INFO("===============================================================================");
            }
            break;
        case '/':
            ROS_INFO("===============================================================================");
            ROS_INFO("pressed / and keyboard control is stoped");
            ROS_INFO("===============================================================================");
            return;
        default:
            break;
        }
    }
}

void quit(int sig)
{
    (void)sig;
    input.shutdown();
    ros::shutdown();
    exit(0);
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "car_teleop_keyboard");
    ros::NodeHandle nh;
    
    TeleopCar teleop_turtle(nh);

    signal(SIGINT,quit);
    
    teleop_turtle.keyLoop();
    quit(0);
    
    return(0);
}