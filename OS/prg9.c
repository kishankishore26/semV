#include<stdio.h>
#include<stdlib.h>

struct process{
	int pid;
	int bt;
	int wt;
	int tat;
};

void read(struct process p[],int n,int rembt[]){
	for(int i=0;i<n;i++){
		p[i].pid=i+1;
		printf("Enter the burst time for the process %d in ms: ",i+1);
		scanf("%d",&p[i].bt);
		rembt[i]=p[i].bt;
	}
}

void display(struct process p[],int n){
	float tottat=0,totwt=0;
	
	printf("-------------------------------------\n");
	printf("PID\tBT\tWT\tTAT\n");
	printf("-------------------------------------\n");
	
	for(int i=0;i<n;i++){
		printf("%d\t%d\t%d\t%d\n",p[i].pid,p[i].bt,p[i].wt,p[i].tat);
		
		totwt=totwt+p[i].wt;
		tottat=tottat+p[i].tat;
	}
	
	printf("Average waiting time: %f\n",totwt/n);
	printf("Average turnaround time: %f\n",tottat/n);
	printf("Total waiting time: %f\n",totwt);
	printf("Total turnaround time: %f\n",tottat);
}	

void roundrobin(struct process p[],int n,int tq,int rembt[]){
	int time=0;
	int done;
	do {
		done=1;
		for(int i=0;i<n;i++){
			if(rembt[i]>0){
				done=0;
				if(rembt[i]>tq){
					rembt[i]=rembt[i]-tq;
					time=time+tq;
				}else{
					time=time+rembt[i];
					rembt[i]=0;
					p[i].tat=time;
					p[i].wt=time-p[i].bt;
				}
			}
		}
	}while(done==0);
}

int main(){
	int n,tq;
	printf("Enter the number of processes: ");
	scanf("%d",&n);
	printf("Enter the time quantum: ");
	scanf("%d",&tq);
	struct process p[n];
	int rembt[n];
	read(p,n,rembt);
	roundrobin(p,n,tq,rembt);
	display(p,n);
	return 0;
}
