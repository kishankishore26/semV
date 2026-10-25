// Write a C++ program to overload binary ‘+’ and ‘–‘ operator to add and subtract two complex numbers. Define relevant data members and member functions for reading and displaying the complex objects. 
#include<iostream>
using namespace std;
class Complex{
	int real;
	float imaginary;
public:
	void read(int r,float i){
		real=r;
		imaginary=i;
	}
	
	void display(){
		cout<<real<<"+i"<<imaginary<<endl;
	}
	
	Complex operator+(Complex c){
		Complex temp;
		temp.real=real+c.real;
		temp.imaginary=imaginary+c.imaginary;
		return temp;
	}
	
	Complex operator-(Complex c){
		Complex temp;
		temp.real=real-c.real;
		temp.imaginary=imaginary-c.imaginary;
		return temp;
	}
};

int main(){
	Complex c1,c2,c3,c4;
	c1.read(1,1.14);
	c2.read(3,2.2);
	cout<<"C1: ";
	c1.display();
	cout<<"C2: ";
	c2.display();
	
	c3=c1+c2;
	cout<<"C3: ";
	c3.display();
	c4=c2-c1;
	cout<<"C4: ";
	c4.display();
	return 0;
}
