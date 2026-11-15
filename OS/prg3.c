#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

int main(){
	int pid;
	
	printf("The parent process id is: %d\n",getpid());
	for(int i=1;i<=5;i++){
		pid=fork();
		
		if(pid<0){
			printf("Fork error\n");
			exit(0);
		}else if(pid==0){
			printf("Child process id is: %d\n",getpid());
			sleep(1);
			exit(0);
		}else{
			wait(NULL);
		}
	}
	return 0;
}
