//
// Created by zjj on 9/5/23.
//
#include "distribute.h"
#include <iostream>
#include <fstream>
#include <vector>

class stu listStu[N];
class SmartCar listCar[N];
std::vector<std::pair<std::string,std::string>> match;

void readCar(std::string path){
    std::ifstream inCar(path,std::ios::in);
    int i = 0;
    while(true){
        class SmartCar tempCar;
        class dp tempDp;
        class lt tempLt;
        class agx tempAgx;
        class camera tempCamera;
        class raidar tempRaidar;
        class tly tempTly;
        class display tempDisplay;
        class battery tempBattery;
        std::string flag;
        inCar>>flag;
        if(!flag.compare("!")){
           inCar>>tempCar.id;
           inCar>>tempDp.id>>tempDp.type>>tempDp.zj>>tempDp.lj>>tempDp.dj>>tempDp.r>>tempDp.dirve>>tempDp.maxL;
           inCar>>flag;
           inCar>>tempLt.type>>tempLt.n>>tempLt.size;
           inCar>>flag;
           inCar>>tempAgx.type>>tempAgx.n>>tempAgx.ai>>tempAgx.cuda>>tempAgx.tensor>>tempAgx.vm>>tempAgx.rom;
           inCar>>flag;
           inCar>>tempCamera.type>>tempCamera.n>>tempCamera.c>>tempCamera.x>>tempCamera.y>>tempCamera.z>>tempCamera.fov>>tempCamera.d;
           inCar>>flag;
           inCar>>tempRaidar.type>>tempRaidar.n>>tempRaidar.t>>tempRaidar.f>>tempRaidar.g;
           inCar>>flag;
           inCar>>tempTly.type>>tempTly.n>>tempTly.cj;
           inCar>>flag;
           inCar>>tempDisplay.size>>tempDisplay.n>>tempDisplay.type;
           inCar>>flag;
           inCar>>tempBattery.type>>tempBattery.n>>tempBattery.gd>>tempBattery.t;
        }else if(!flag.compare("~")){
            break;
        }
        tempDp.lt_ = tempLt;
        tempCar.dp_ = tempDp;
        tempCar.agx_ = tempAgx;
        tempCar.camera_ = tempCamera;
        tempCar.raidar_ = tempRaidar;
        tempCar.tly_ = tempTly;
        tempCar.display_ = tempDisplay;
        tempCar.battery_ = tempBattery;
        listCar[i] = tempCar;
        i ++;
    }
    inCar.close();
}

void readStu(std::string path){
    std::ifstream inStu(path,std::ios::in);
    int i = 0;
    while(true){
        class stu tempStu;
        char flag;
        inStu>>flag;
        if(flag == '!'){
            inStu>>tempStu.id>>tempStu.name;
        }else if(flag == '~'){
            break;
        }
        listStu[i] = tempStu;
        i ++;
    }
    inStu.close();
}

void matchAndSave(std::string path){
    std::ofstream outMatch(path,std::ios::out);
    for (int i = 0; i < N; ++i) {
        match.push_back(std::pair<std::string,std::string>(listStu[i].id,listCar[i].id));
        outMatch<<listStu[i].id<<" "<<listCar[i].id<<std::endl;
    }
    outMatch.close();
}

void displayInfo(int i){
    class SmartCar car = listCar[i];
    std::cout<<"====================="<<std::endl;
    std::cout<<"====================="<<std::endl;
    std::cout<<"car id:"<<car.id<<std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout<<"底盘："<<std::endl;
    std::cout<<"id:"<<car.dp_.id<<std::endl;
    std::cout<<"type:"<<car.dp_.type<<std::endl;
    std::cout<<"轴距:"<<car.dp_.zj<<std::endl;
    std::cout<<"轮距:"<<car.dp_.lj<<std::endl;
    std::cout<<"最小离地间隙:"<<car.dp_.dj<<std::endl;
    std::cout<<"最小转弯半径:"<<car.dp_.r<<std::endl;
    std::cout<<"驱动形式:"<<car.dp_.dirve<<std::endl;
    std::cout<<"最大行程:"<<car.dp_.maxL<<std::endl;
    std::cout<<"轮胎:"<<car.dp_.lt_.n<<"个"<<std::endl;
    std::string gm="?";
    if (car.dp_.lt_.type == "gm") gm = "公路论、麦克纳姆轮";
    std::cout<<"\t型号:"<<gm<<std::endl;
    std::cout<<"\t尺寸:"<<car.dp_.lt_.size<<std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "AGX套件信息："<<car.agx_.n<<"个" << std::endl;
    std::cout << "  型号: " << car.agx_.type << std::endl;
    std::cout << "  AI性能: " << car.agx_.ai << " TOPS" << std::endl;
    std::cout << "  CUDA核心数: " << car.agx_.cuda << std::endl;
    std::cout << "  Tensor CORE数: " << car.agx_.tensor << std::endl;
    std::cout << "  显存: " << car.agx_.vm << "G" << std::endl;
    std::cout << "  存储: " << car.agx_.rom << "G" << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "双目摄像头信息："<<car.camera_.n<<"个" << std::endl;
    std::cout << "  型号: " << car.camera_.type << std::endl;
    std::cout << "  摄像头: " << car.camera_.c << std::endl;
    std::cout << "  分辨率: " << car.camera_.x<<"*"<<car.camera_.y << std::endl;
    std::cout << "  帧率: " << car.camera_.z << std::endl;
    std::cout << "  FOV: " << car.camera_.fov << std::endl;
    std::cout << "  深度帧率: " << car.camera_.d << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "多线激光雷达信息："<<car.raidar_.n<<"个" << std::endl;
    std::cout << "  型号: " << car.raidar_.type << std::endl;
    std::cout << "  通道数: " << car.raidar_.t << std::endl;
    std::cout << "  测试范围: " << car.raidar_.f << "m" << std::endl;
    std::cout << "  功耗: " << car.raidar_.g << "W" << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "9轴陀螺仪信息："<<car.tly_.n<<"个" << std::endl;
    std::cout << "  型号: " << car.tly_.type << std::endl;
    std::cout << "  厂家: " << car.tly_.cj << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "液晶显示屏信息："<<car.display_.n<<"个" << std::endl;
    std::cout << "  尺寸: " << car.display_.size << "寸" << std::endl;
    std::cout << "  型号: " << car.display_.type << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "电池模块信息："<<car.battery_.n<<"个" << std::endl;
    std::cout << "  参数: " << car.battery_.type << std::endl;
    std::cout << "  对外供电: " << car.battery_.gd << "V" << std::endl;
    std::cout << "  充电时长: " << car.battery_.t << "小时" << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout << "分配给学生：" << std::endl;
    std::cout << "  学号: " << listStu[i].id << std::endl;
    std::cout << "  姓名: " << listStu[i].name << std::endl;
    std::cout<<"*********************"<<std::endl;
    std::cout<<"====================="<<std::endl;
    std::cout<<"====================="<<std::endl;
}

void look(){
    for (int i = -1; i < N; ) {
        std::cout<<"press n to look next, press p look previous, prees q to quit"<<std::endl;
        char opt;
        std::cin>>opt;
        if (opt == 'n'){
            if(i == N-1){
                std::cout<<"you can't look next"<<std::endl;
            }else{
                i++;
                displayInfo(i);
            }
        } else if (opt == 'p'){
            if(i == -1){
                std::cout<<"you can't look previous"<<std::endl;
            }else{
                i--;
                displayInfo(i);
            }
        } else if (opt == 'q'){
            break;
        }
    }
}

int main(){
    std::string path_car = "../SmartCarList", path_stu = "../stuList",path_match = "../match";
    readCar(path_car);
    readStu(path_stu);
    matchAndSave(path_match);
    look();
    return 0;
}