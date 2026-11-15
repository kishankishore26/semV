#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<string.h>

int main(){
	int fd,size;
	char filename[20],buffer[1000];
	
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fd=open(filename,O_WRONLY|O_CREAT|O_TRUNC,0777);
	if(fd<0){
		printf("Read error\n");
		exit(0);
	}
	printf("Enter the contents: \n");
	while(1){
		size=read(0,buffer,sizeof(buffer));
		if(size<0){
			printf("Read error\n");
			exit(0);
		}
		
		if(size==0){
			break;
		}else{
			write(fd,buffer,strlen(buffer));
		}
	}
	
	close(fd);
	return 0;
}
