//
// Created by zjj on 9/5/23.
//

#ifndef EIE_1_SOFT_DISTRIBUTE_H
#define EIE_1_SOFT_DISTRIBUTE_H

#define N 10

#include <string>

void readCar(std::string path);

void readStu(std::string path);

void matchAndSave(std::string path);

void displayInfo(int i);

void look();

class stu{
public:
    std::string id;
    std::string name;
};

class lt{
public:
    std::string type;
    int n;
    int size;
};

class dp{
public:
    std::string id;
    std::string type;
    int zj;
    int lj;
    int dj;
    int r;
    std::string dirve;
    int maxL;
    lt lt_;
};

class agx{
public:
    std::string type;
    int n;
    int ai;
    int cuda;
    int tensor;
    int vm;
    int rom;
};

class camera{
public:
    std::string type;
    int n;
    std::string c;
    int x;
    int y;
    int z;
    int fov;
    int d;
};

class raidar{
public:
    std::string type;
    int n;
    int t;
    int f;
    int g;
};

class tly{
public:
    std::string type;
    int n;
    std::string cj;
};

class display{
public:
    std::string type;
    int n;
    float size;
};

class battery{
public:
    std::string type;
    int n;
    int gd;
    int t;
};

class SmartCar{
public:
    std::string id;
    dp dp_;
    agx agx_;
    camera camera_;
    raidar raidar_;
    tly tly_;
    display display_;
    battery battery_;
};


#endif //EIE_1_SOFT_DISTRIBUTE_H
