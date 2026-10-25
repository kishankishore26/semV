//Write a C++ program for the diagram using Hierarchical inheritance. Use your own data members and member functions to display student details. 
#include<iostream>
using namespace std;
class Student{
protected:
	char name[20];
	int age;
	int usn;
public:
	void getStudent(){
		cout<<"Enter name: ";
		cin>>name;
		cout<<"Enter age: ";
		cin>>age;
		cout<<"Enter USN: ";
		cin>>usn;
	}
};

class medical:public Student{
	int year;
public:
	void getMedical(){
		cout<<"Enter year: ";
		cin>>year;
	}
	
	void display(){
		cout<<"Medical student info: "<<endl;
		cout<<"Name: "<<name<<endl;
		cout<<"Age: "<<age<<endl;
		cout<<"USN: "<<usn<<endl;
		cout<<"Year: "<<year<<endl;
	}
};

class engineering:public Student{
	int sem;
	char branch[20];
public: 
	void getEngineering(){
		cout<<"Enter semester: ";
		cin>>sem;
		cout<<"Enter branch: ";
		cin>>branch;
	}
	
	void display(){
		cout<<"Engineering student info: "<<endl;
		cout<<"Name: "<<name<<endl;
		cout<<"Age: "<<age<<endl;
		cout<<"USN: "<<age<<endl;
		cout<<"Semester: "<<sem<<endl;
		cout<<"Branch: "<<branch<<endl;
	}
};

int main(){
	medical m;
	cout<<"Enter medical student info: "<<endl;
	m.getStudent();
	m.getMedical();
	m.display();
	
	engineering e;
	cout<<"Enter engineering student info: "<<endl;
	e.getStudent();
	e.getEngineering();
	e.display();
	
	return 0;
}
