#include<stdio.h>
#include<stdlib.h>

struct process {
	int pid;
	int bt;
	int wt;
	int tat;
};

void read(struct process p[],int n){
	for(int i=0;i<n;i++){
		p[i].pid=i+1;
		printf("Enter the burst time of the process %d in ms: ",i+1);
		scanf("%d",&p[i].bt);
	}
}

void print(struct process p[],int n){
	float tottat=0,totwt=0;
	printf("-------------------------------------------\n");
	printf("PID\tBT\tWT\tTAT\n");
	printf("-------------------------------------------\n");
	
	for(int i=0;i<n;i++){
		printf("%d\t%d\t%d\t%d\n",p[i].pid,p[i].bt,p[i].wt,p[i].tat);
		
		tottat=tottat+p[i].tat;
		totwt=totwt+p[i].wt;
	}
	
	printf("Total waiting time: %f\n",totwt);
	printf("Total turnaround time: %f\n",tottat);
	printf("Average waiting time: %f\n",totwt/n);
	printf("Average turnaround time: %f\n",tottat/n);
}

void sjf(struct process p[],int n){
	p[0].wt=0;
	p[0].tat=p[0].bt;
	
	for(int i=1;i<n;i++){
		p[i].wt=p[i-1].wt+p[i-1].bt;
		p[i].tat=p[i].wt+p[i].bt;
	}
}

void sort(struct process p[],int n){
	struct process temp;
	for(int i=0;i<n-1;i++){
		int min=i;
		for(int j=i+1;j<n;j++){
			if(p[j].bt<p[min].bt){
				min=j;
			}
		}
		temp=p[i];
		p[i]=p[min];
		p[min]=temp;
	}
}	

int main(){
	int n;
	printf("Enter the number of processes: ");
	scanf("%d",&n);
	struct process p[n];
	read(p,n);
	sort(p,n);
	sjf(p,n);
	print(p,n);
	return 0;
}
