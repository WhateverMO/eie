//
// Created by zjj on 9/5/23.
//

#ifndef EIE_1_SOFT_DISTRIBUTE_H
#define EIE_1_SOFT_DISTRIBUTE_H

#define N 10

#include "Observer.h"
#include "Subject.h"
#include <string>
#include <fstream>
#include <vector>
#include <map>

static std::map<std::string,std::string> type2name={
    {"gm","公路轮、麦克纳姆轮"}
};
static std::map<std::string,std::string> state2action={
    {"left","right"},
    {"right","left"},
    {"front","back"}
};

class stu{
private:
    std::string id;
    std::string name;
public:
    std::string getID();
    void setID(std::string id);
    void setName(std::string name);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);    
};

class tyre{
private:
    std::string type;
    int n;
    int size;
public:
    void setType(std::string type);
    void setN(int n);
    void setSize(int size);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class chassis:public Observer{
private:
    std::string id;
    std::string type;
    int wheelbase;
    int wheelTrack;
    int groundClearance;
    int r;
    std::string dirve;
    int maxL;
    tyre tyre_;
public:
    void update(Subject *subject);
    void setID(std::string id);
    void setType(std::string type);
    void setWheelbase(int wheelbase);
    void setWheelTrack(int wheelTrack);
    void setGroundClearance(int groundClearance);
    void setR(int r);
    void setDirve(std::string dirve);
    void setMaxL(int maxL);
    void setTyre(tyre tyre);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class agx{
private:
    std::string type;
    int n;
    int aiPerformance;
    int cuda;
    int tensor;
    int videoMemory;
    int rom;
public:
    void setType(std::string type);
    void setN(int n);
    void setAiPerformance(int aiPerformance);
    void setCuda(int cuda);
    void setTensor(int tensor);
    void setVideoMemory(int videoMemory);
    void setRom(int rom);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class camera{
private:
    std::string type;
    int n;
    std::string name;
    int x;
    int y;
    int frame;
    int fov;
    int depth;
public:
    void setType(std::string type);
    void setN(int n);
    void setName(std::string name);
    void setX(int x);
    void setY(int y);
    void setFrame(int frame);
    void setFov(int fov);
    void setDepth(int depth);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};


class raidar:public Subject{
private:
    std::string type;
    int n;
    int channel;
    int range;
    int power;
    std::string state;
public:
    std::string getState();
    void setState(std::string s);
    void setType(std::string type);
    void setN(int n);
    void setChannel(int channel);
    void setRange(int range);
    void setPower(int power);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class gyro{
private:
    std::string type;
    int n;
    std::string manufacturer;
public:
    void setType(std::string type);
    void setN(int n);
    void setManufacturer(std::string manufacturer);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class display{
private:
    std::string type;
    int n;
    float size;
public:
    void setType(std::string type);
    void setN(int n);
    void setSize(float size);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class battery{
private:
    std::string type;
    int n;
    int power;
    int chargeTime;
public:
    void setType(std::string type);
    void setN(int n);
    void setPower(int power);
    void setChargeTime(int chargeTime);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

class smartCar{
private:
    std::string id;
    chassis chassis_;
    agx agx_;
    camera camera_;
    raidar raidar_;
    gyro gyro_;
    display display_;
    battery battery_;
public:
    std::string getID();
    void raidarSetState(std::string s);
    void raidarAttachChassis();
    void raidarDetachChassis();
    void raidarNotify();
    void setID(std::string id);
    void setChassis(chassis chassis);
    void setAgx(agx agx);
    void setCamera(camera camera);
    void setRaidar(raidar raidar);
    void setGyro(gyro gyro);
    void setDisplay(display display);
    void setBattery(battery battery);
    void load(std::ifstream &in);
    void print();
    void save(std::ofstream &out);
};

std::vector<smartCar> readCar(std::string path);

std::vector<stu> readStu(std::string path);

void matchAndSave(std::string path);

void displayInfo(int i);

void look();

#endif //EIE_1_SOFT_DISTRIBUTE_H
