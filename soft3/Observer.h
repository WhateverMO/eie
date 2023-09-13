#ifndef OBSERVER_H
#define OBSERVER_H

#include <string>
using namespace std;
class Subject;

class Observer {
	public:
		virtual void update(Subject *subject) = 0;
};

#endif