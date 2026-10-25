//Write C++ program to design a class called Bank Account. Include following data members like name of the depositor, account number and balance. Use following member functions a) to initialize values b) deposit an amount c) to withdraw an amount d) to display name and balance. 

#include<iostream>
using namespace std;
class bankAccount {
	int accNo;
	char name[20];
	int balance;
public:
	void read(){
		cout<<"Enter account number: ";
		cin>>accNo;
		cout<<"Enter customer name: ";
		cin>>name;
		cout<<"Enter the balance: ";
		cin>>balance;
	}
	
	void print(){
		cout<<"Name: "<<name<<endl;
		cout<<"Account number: "<<accNo<<endl;
		cout<<"Available balance: "<<balance<<endl;
	}
	
	void withdraw(){
		int amount=0;
		cout<<"Enter the amount to withdraw: ";
		cin>>amount;
		if(amount > balance){
			cout<<"Insufficient Balance!"<<endl;
		}else{
			balance=balance-amount;
			cout<<"Amount withdrawn successfully. Remaining balance is: "<<balance<<endl;
		}
	}
	
	void deposit(){
		int amount=0;
		cout<<"Enter the amount to deposit: ";
		cin>>amount;
		balance=balance+amount;
		cout<<"Amount deposited succesfully. Available balance is: "<<balance<<endl;
	}
};

int main(){
	bankAccount b;
	b.read();
	b.print();
	b.deposit();
	b.withdraw();
	return 0;
}
	
