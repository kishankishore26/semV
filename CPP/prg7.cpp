//write a C++ program to demonstrate the working of dynamic constructors using a class STRNG with string as data member inside the class, include appropriate member functions to display the object data and a member function to concatenate two strings. 
#include<iostream>
#include<string.h>
using namespace std;
class String{
	int length;
	char *name;
public:
	String(){}
	String(char s[]){
		length=strlen(s);
		name=new char[length+1];
		name=strcpy(name,s);
	}
	
	void join(String A, String B){
		length=A.length+B.length;
		name=new char[length+1];
		name=strcpy(name,A.name);
		name=strcat(name,B.name);
	}
	
	void display(){
		cout<<"Name: "<<name<<endl;
	}
};

int main(){
	String s1("wel");
	String s2("come");
	
	cout<<"String 1: ";
	s1.display();
	cout<<"String 2: ";
	s2.display();
	String s3;
	s3.join(s1,s2);
	cout<<"String 3: ";
	s3.display();
}
