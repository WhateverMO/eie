//
// Created by zjj on 9/5/23.
//

#ifndef DISTRIBUTION_MAIN_H
#define DISTRIBUTION_MAIN_H

#include <iostream>
#include "distribute.h"

using namespace std;

int main(){
    std::string path_car = "../school/List/smartCarList", path_stu = "../school/List/stuList",path_match = "../school/List/match";
    std::vector<stu> listStu = readStu(path_stu);
    std::vector<smartCar> listCar = readCar(path_car);
    smartCar car = listCar[0];
    car.raidarAttachChassis();
    for(auto it=state2action.begin(); it!=state2action.end(); it++){
        car.raidarSetState(it->first);
        car.raidarNotify();
    }
        car.raidarDetachChassis();
    // matchAndSave(path_match);
    // smartCar car = listCar[0];
    // ofstream out("../carSave");
    // car.save(out);
    // out.close();
    // look();
    return 0;
}

#endif //DISTRIBUTION_MAIN_H