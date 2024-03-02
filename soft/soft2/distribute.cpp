//
// Created by zjj on 9/5/23.
//
#include "distribute.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <map>

std::vector<stu> listStu;
std::vector<smartCar> listCar;
std::vector<std::pair<std::string,std::string>> match;
std::map<std::string,std::string> type2name={
    {"gm","公路轮、麦克纳姆轮"}
};


std::vector<smartCar> readCar(std::string path){
    std::ifstream inCar(path,std::ios::in);
    int i = 0;
    while(true){
        smartCar tempCar;
        char flag;
        inCar>>flag;
        tempCar.load(inCar);
        if(flag == '~'){
            break;
        }
        listCar.push_back(tempCar);
        i ++;
    }
    inCar.close();
    return listCar;
}

std::vector<stu> readStu(std::string path){
    std::ifstream inStu(path,std::ios::in);
    int i = 0;
    while(true){
        class stu tempStu;
        char flag;
        inStu>>flag;
        if(flag == '!'){
            tempStu.load(inStu);
        }else if(flag == '~'){
            break;
        }
        listStu.push_back(tempStu);
        i ++;
    }
    inStu.close();
    return listStu;
}

void matchAndSave(std::string path){
    std::ofstream outMatch(path,std::ios::out);
    for (int i = 0; i < N; ++i) {
        match.push_back(std::pair<std::string,std::string>(listStu[i].getID(),listCar[i].getID()));
        outMatch<<listStu[i].getID()<<" "<<listCar[i].getID()<<std::endl;
    }
    outMatch.close();
}

void displayInfo(int i){
    class smartCar car = listCar[i];
    std::cout<<"====================="<<std::endl;
    std::cout<<"====================="<<std::endl;
    car.print();
    std::cout<<"====================="<<std::endl;
    class stu stu = listStu[i];
    stu.print();
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
                displayInfo(i);
                i--;
            }
        } else if (opt == 'q'){
            break;
        }
    }
}

std::string stu::getID()
{
    return this->id;
}

void stu::setID(std::string id)
{
    this->id = id;
}

void stu::setName(std::string name)
{
    this->name = name;
}

void stu::load(std::ifstream &in)
{
    std::string id,name;
    in>>id>>name;
    this->id = id;
    this->name = name;
}

void stu::print()
{
    std::cout<<"id:"<<this->id<<std::endl;
    std::cout<<"name:"<<this->name<<std::endl;
}

void stu::save(std::ofstream &out)
{
    out<<this->id<<" "<<this->name<<std::endl;
}

void tyre::setType(std::string type)
{
    this->type = type;
}

void tyre::setN(int n)
{
    this->n = n;
}

void tyre::setSize(int size)
{
    this->size = size;
}

void tyre::load(std::ifstream &in)
{
    std::string type;
    int n,size;
    in>>type>>n>>size;
    this->type = type;
    this->n = n;
    this->size = size;
}

void tyre::print()
{

    std::cout<<"type:"<<type2name[this->type]<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"size:"<<this->size<<std::endl;
}

void tyre::save(std::ofstream &out)
{
    out<<this->type<<" "<<this->n<<" "<<this->size<<std::endl;
}

void chassis::setID(std::string id)
{
    this->id = id;
}

void chassis::setType(std::string type)
{
    this->type = type;
}

void chassis::setWheelbase(int wheelbase)
{
    this->wheelbase = wheelbase;
}

void chassis::setWheelTrack(int wheelTrack)
{
    this->wheelTrack = wheelTrack;
}

void chassis::setGroundClearance(int groundClearance)
{
    this->groundClearance = groundClearance;
}

void chassis::setR(int r)
{
    this->r = r;
}

void chassis::setDirve(std::string dirve)
{
    this->dirve = dirve;
}

void chassis::setMaxL(int maxL)
{
    this->maxL = maxL;
}

void chassis::setTyre(tyre tyre)
{
    this->tyre_ = tyre;
}

void chassis::load(std::ifstream &in)
{
    std::string id,type,dirve,tyrePath;
    int wheelbase,wheelTrack,groundClearance,r,maxL,n,size;
    in>>id>>type>>wheelbase>>wheelTrack>>groundClearance>>r>>dirve>>maxL>>tyrePath;
    this->id = id;
    this->type = type;
    this->wheelbase = wheelbase;
    this->wheelTrack = wheelTrack;
    this->groundClearance = groundClearance;
    this->r = r;
    this->dirve = dirve;
    this->maxL = maxL;
    std::ifstream inTyre(tyrePath,std::ios::in);
    this->tyre_.load(inTyre);
    inTyre.close();
}

void chassis::print()
{
    std::cout<<"id:"<<this->id<<std::endl;
    std::cout<<"type:"<<this->type<<std::endl;
    std::cout<<"wheelbase:"<<this->wheelbase<<std::endl;
    std::cout<<"wheelTrack:"<<this->wheelTrack<<std::endl;
    std::cout<<"groundClearance:"<<this->groundClearance<<std::endl;
    std::cout<<"r:"<<this->r<<std::endl;
    std::cout<<"dirve:"<<this->dirve<<std::endl;
    std::cout<<"maxL:"<<this->maxL<<std::endl;
    std::cout<<"*********************"<<std::endl;
    this->tyre_.print();
}

void chassis::save(std::ofstream &out)
{
    out<<this->id<<" "<<this->type<<" "<<this->wheelbase<<" "<<this->wheelTrack<<" "<<this->groundClearance<<" "<<this->r<<" "<<this->dirve<<" "<<this->maxL<<std::endl;
    this->tyre_.save(out);
}

void agx::setType(std::string type)
{
    this->type = type;
}

void agx::setN(int n)
{
    this->n = n;
}

void agx::setAiPerformance(int aiPerformance)
{
    this->aiPerformance = aiPerformance;
}

void agx::setCuda(int cuda)
{
    this->cuda = cuda;
}

void agx::setTensor(int tensor)
{
    this->tensor = tensor;
}

void agx::setVideoMemory(int videoMemory)
{
    this->videoMemory = videoMemory;
}

void agx::setRom(int rom)
{
    this->rom = rom;
}

void agx::load(std::ifstream &in)
{
    std::string type;
    int n,aiPerformance,cuda,tensor,videoMemory,rom;
    in>>type>>n>>aiPerformance>>cuda>>tensor>>videoMemory>>rom;
    this->type = type;
    this->n = n;
    this->aiPerformance = aiPerformance;
    this->cuda = cuda;
    this->tensor = tensor;
    this->videoMemory = videoMemory;
    this->rom = rom;
}

void agx::print()
{
    std::cout<<"type:"<<this->type<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"aiPerformance:"<<this->aiPerformance<<std::endl;
    std::cout<<"cuda:"<<this->cuda<<std::endl;
    std::cout<<"tensor:"<<this->tensor<<std::endl;
    std::cout<<"videoMemory:"<<this->videoMemory<<std::endl;
    std::cout<<"rom:"<<this->rom<<std::endl;
}

void agx::save(std::ofstream &out)
{
    out<<this->type<<" "<<this->n<<" "<<this->aiPerformance<<" "<<this->cuda<<" "<<this->tensor<<" "<<this->videoMemory<<" "<<this->rom<<std::endl;
}

void camera::setType(std::string type)
{
    this->type = type;
}

void camera::setN(int n)
{
    this->n = n;
}

void camera::setName(std::string name)
{
    this->name = name;
}

void camera::setX(int x)
{
    this->x = x;
}

void camera::setY(int y)
{
    this->y = y;
}

void camera::setFrame(int frame)
{
    this->frame = frame;
}

void camera::setFov(int fov)
{
    this->fov = fov;
}

void camera::setDepth(int depth)
{
    this->depth = depth;
}

void camera::load(std::ifstream &in)
{
    std::string type,name;
    int n,x,y,frame,fov,depth;
    in>>type>>n>>name>>x>>y>>frame>>fov>>depth;
    this->type = type;
    this->n = n;
    this->name = name;
    this->x = x;
    this->y = y;
    this->frame = frame;
    this->fov = fov;
    this->depth = depth;
}

void camera::print()
{
    std::cout<<"type:"<<this->type<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"name:"<<this->name<<std::endl;
    std::cout<<"c:"<<this->name<<std::endl;
    std::cout<<"x:"<<this->x<<std::endl;
    std::cout<<"y:"<<this->y<<std::endl;
    std::cout<<"frame:"<<this->frame<<std::endl;
    std::cout<<"fov:"<<this->fov<<std::endl;
    std::cout<<"depth:"<<this->depth<<std::endl;
}

void camera::save(std::ofstream &out)
{
    out<<this->type<<" "<<this->n<<" "<<this->name<<" "<<this->name<<" "<<this->x<<" "<<this->y<<" "<<this->frame<<" "<<this->fov<<" "<<this->depth<<std::endl;
}

void raidar::setType(std::string type)
{
    this->type = type;
}

void raidar::setN(int n)
{
    this->n = n;
}

void raidar::setChannel(int channel)
{
    this->channel = channel;
}

void raidar::setRange(int range)
{
    this->range = range;
}

void raidar::setPower(int power)
{
    this->power = power;
}

void raidar::load(std::ifstream &in)
{
    std::string type;
    int n,channel,range,power;
    in>>type>>n>>channel>>range>>power;
    this->type = type;
    this->n = n;
    this->channel = channel;
    this->range = range;
    this->power = power;
}

void raidar::print()
{
    std::cout<<"type:"<<this->type<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"channel:"<<this->channel<<std::endl;
    std::cout<<"range:"<<this->range<<std::endl;
    std::cout<<"power:"<<this->power<<std::endl;
}

void raidar::save(std::ofstream &out)
{
    out<<this->type<<" "<<this->n<<" "<<this->channel<<" "<<this->range<<" "<<this->power<<std::endl;
}

void gyro::setType(std::string type)
{
    this->type = type;
}

void gyro::setN(int n)
{
    this->n = n;
}

void gyro::setManufacturer(std::string manufacturer)
{
    this->manufacturer = manufacturer;
}

void gyro::load(std::ifstream &in)
{
    std::string type,manufacturer;
    int n;
    in>>type>>n>>manufacturer;
    this->type = type;
    this->n = n;
    this->manufacturer = manufacturer;
}

void gyro::print()
{
    std::cout<<"type:"<<this->type<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"manufacturer:"<<this->manufacturer<<std::endl;
}

void gyro::save(std::ofstream &out)
{
    out<<this->type<<" "<<this->n<<" "<<this->manufacturer<<std::endl;
}

void display::setN(int n)
{
    this->n = n;
}

void display::setSize(float size)
{
    this->size = size;
}

void display::setType(std::string type)
{
    this->type = type;
}

void display::load(std::ifstream &in)
{
    std::string type;
    int n;
    float size;
    in>>type>>n>>size;
    this->type = type;
    this->n = n;
    this->size = size;
}

void display::print()
{
    std::cout<<"size:"<<this->size<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"type:"<<this->type<<std::endl;
}

void display::save(std::ofstream &out)
{
    out<<this->size<<" "<<this->n<<" "<<this->type<<std::endl;
}

void battery::setType(std::string type)
{
    this->type = type;
}

void battery::setN(int n)
{
    this->n = n;
}

void battery::setPower(int power)
{
    this->power = power;
}

void battery::setChargeTime(int chargeTime)
{
    this->chargeTime = chargeTime;
}

void battery::load(std::ifstream &in)
{
    std::string type;
    int n,power,chargeTime;
    in>>type>>n>>power>>chargeTime;
    this->type = type;
    this->n = n;
    this->power = power;
    this->chargeTime = chargeTime;
}

void battery::print()
{
    std::cout<<"type:"<<this->type<<std::endl;
    std::cout<<"n:"<<this->n<<std::endl;
    std::cout<<"power:"<<this->power<<std::endl;
    std::cout<<"chargeTime:"<<this->chargeTime<<std::endl;
}

void battery::save(std::ofstream &out)
{
    out<<this->type<<" "<<this->n<<" "<<this->power<<" "<<this->chargeTime<<std::endl;
}

std::string smartCar::getID()
{
    return this->id;
}

void smartCar::setID(std::string id)
{
    this->id = id;
}

void smartCar::setChassis(chassis chassis)
{
    this->chassis_ = chassis;
}

void smartCar::setAgx(agx agx)
{
    this->agx_ = agx;
}

void smartCar::setCamera(camera camera)
{
    this->camera_ = camera;
}

void smartCar::setRaidar(raidar raidar)
{
    this->raidar_ = raidar;
}

void smartCar::setGyro(gyro gyro)
{
    this->gyro_ = gyro;
}

void smartCar::setDisplay(display display)
{
    this->display_ = display;
}

void smartCar::setBattery(battery battery)
{
    this->battery_ = battery;
}

void smartCar::load(std::ifstream &in)
{
    std::string id,chassisPath,agxPath,cameraPath,raidarPath,gyroPath,displayPath,batteryPath;
    in>>id>>chassisPath>>agxPath>>cameraPath>>raidarPath>>gyroPath>>displayPath>>batteryPath;
    this->id = id;
    std::ifstream inChassis(chassisPath,std::ios::in);
    this->chassis_.load(inChassis);
    inChassis.close();
    std::ifstream inAgx(agxPath,std::ios::in);
    this->agx_.load(inAgx);
    inAgx.close();
    std::ifstream inCamera(cameraPath,std::ios::in);
    this->camera_.load(inCamera);
    inCamera.close();
    std::ifstream inRaidar(raidarPath,std::ios::in);
    this->raidar_.load(inRaidar);
    inRaidar.close();
    std::ifstream inGyro(gyroPath,std::ios::in);
    this->gyro_.load(inGyro);
    inGyro.close();
    std::ifstream inDisplay(displayPath,std::ios::in);
    this->display_.load(inDisplay);
    inDisplay.close();
    std::ifstream inBattery(batteryPath,std::ios::in);
    this->battery_.load(inBattery);
    inBattery.close();
}

void smartCar::print()
{
    std::cout<<"id:"<<this->id<<std::endl;
    std::cout<<"*********************"<<std::endl;
    this->chassis_.print();
    std::cout<<"*********************"<<std::endl;
    this->agx_.print();
    std::cout<<"*********************"<<std::endl;
    this->camera_.print();
    std::cout<<"*********************"<<std::endl;
    this->raidar_.print();
    std::cout<<"*********************"<<std::endl;
    this->gyro_.print();
    std::cout<<"*********************"<<std::endl;
    this->display_.print();
    std::cout<<"*********************"<<std::endl;
    this->battery_.print();
    std::cout<<"*********************"<<std::endl;
}

void smartCar::save(std::ofstream &out)
{
    out<<this->id<<std::endl;
    this->chassis_.save(out);
    this->agx_.save(out);
    this->camera_.save(out);
    this->raidar_.save(out);
    this->gyro_.save(out);
    this->display_.save(out);
    this->battery_.save(out);
}