#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

void handler(int s){
	printf("Signal number is: %d\n",s);
	
	switch(s){
		case 1:printf("SIGHUP handled\n");
			break;
		case 2:printf("SIGINT handled\n");
			break;
		case 15:printf("SIGTERM handled\n");
			break;
		case 14:printf("SIGALRM handled\n");
			break;
		case 10:printf("SIGUSR1 handled\n");
			break;
	}
	sleep(2);
	printf("Exiting the handler\n");
}

int main(){
	signal(SIGHUP,handler);
	signal(SIGINT,handler);
	signal(SIGTERM,handler);
	signal(SIGALRM,handler);
	signal(SIGUSR1,handler);
	
	printf("Process id is: %d\n",getpid());
	alarm(10);
	alarm(20);
	while(1){
		printf("Waiting for signals....\n");
		sleep(5);
	}
	return 0;
}
