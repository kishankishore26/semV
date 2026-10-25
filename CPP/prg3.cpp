//Write a C++ program with class Time with data members that represents hours and minutes. Include appropriate member functions to compute time in hours and minutes. (Use of objects as arguments). 

#include<iostream>
using namespace std;
class Time {
	int hours;
	int minutes;
public:
	void read(int h,int m){
		hours=h;
		minutes=m;
	}
	
	void print(){
		cout<<"Hours: "<<hours<<endl;
		cout<<"Minutes: "<<minutes<<endl;
	}
	
	void compute(Time t1,Time t2){
		int h=(t1.minutes+t2.minutes)/60;
		minutes=(t1.minutes+t2.minutes)%60;
		hours=t1.hours+t2.hours+h;
	}
};

int main(){
	Time A,B,C;
	A.read(3,40);
	B.read(1,20);
	cout<<"A: "<<endl;;
	A.print();
	cout<<"B: "<<endl;;
	B.print();
	C.compute(A,B);
	cout<<"C: "<<endl;
	C.print();
	return 0; 
}
