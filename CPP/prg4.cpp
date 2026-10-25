//Given that an EMPLOYEE class contains following members. Data members: Eno, Ename and salary Member functions: to read the data, to print data members. Write a C++ program to read the data of N employees and display details of each employee.(use Array of objects concept). 

#include<iostream>
using namespace std;
class Employee {
	int empNo;
	char empName[20];
	float empSalary;
public:
	void read(){
		cout<<"Enter employee name: ";
		cin>>empName;
		cout<<"Enter employee number: ";
		cin>>empNo;
		cout<<"Enter employee salary: ";
		cin>>empSalary;
	}
	
	void print(){
		cout<<"Employee Name: "<<empName<<endl;
		cout<<"Employee number: "<<empNo<<endl;
		cout<<"Employee salary: "<<empSalary<<endl;
	}
};

int main(){
	Employee e[10];
	int n;
	cout<<"Enter the number of employees: ";
	cin>>n;
	cout<<"Enter employee Details: "<<endl;
	for(int i=0;i<n;i++){
		cout<<"Enter employee "<<i+1<<" details: "<<endl;
		e[i].read();
		cout<<endl;
	}
	
	cout<<"Employee Details: "<<endl;
	for(int i=0;i<n;i++){
		cout<<"Details of employee "<<i+1<<": "<<endl;
		e[i].print();
		cout<<endl;
	}
}
