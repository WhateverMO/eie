#ifndef SUBJECT_H
#define SUBJECT_H

#include "Observer.h"
#include <list>
#include <string>

using namespace std;

class Observer;

class Subject {
	public:
		void attach(Observer *obs){
			_observers.push_back(obs);
		}
		void detach(Observer *obs){
			_observers.remove(obs);
		}
		void Notify(){
			for(Observer *obs:_observers)
				obs->update(this);
		}
		virtual string getState() = 0;
		virtual void setState(string s) = 0;

	protected:
		list<Observer*> _observers;
};

#endif