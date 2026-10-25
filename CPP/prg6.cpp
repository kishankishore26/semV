//Write a C++ program to create a class sample with integer, character and float data members. Demonstrate Constructor Overloading on this class with all types of constructors including default argument constructor. 
#include<iostream>
using namespace std;
class Sample{
	int i;
	char c;
	double d;
public:
	Sample(){
		i=0;
		c='\0';
		d=0.0;
	}
	
	Sample(int x,char y,double z){
		i=x;
		c=y;
		d=z;
	}
	
	Sample(Sample &s){
		i=s.i;
		c=s.c;
		d=s.d;
	}
	
	Sample(int x,double z,char y='K'){
		i=x;
		c=y;
		d=z;
	}
	
	void display(){
		cout<<"i: "<<i<<endl;
		cout<<"c: "<<c<<endl;
		cout<<"d: "<<d<<endl;
	}
};

int main(){
	Sample s1;
	cout<<"S1: "<<endl;
	s1.display();
	
	Sample s2(8,'K',8.8);
	cout<<"S2: "<<endl;
	s2.display();
	
	Sample s3(s2);
	cout<<"S3: "<<endl;
	s3.display();
	
	Sample s4(8,8.8);
	cout<<"S4: "<<endl;
	s4.display();
	
	return 0;
}	
