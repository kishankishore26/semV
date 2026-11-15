#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int main(){
	char filename[20];
	printf("Enter the filename: \n");
	scanf("%s",filename);
	
	if(execl("/bin/sh","sh",filename,NULL)==-1){
		printf("Read error\n");
		exit(0);
	}
	
	return 0;
}
