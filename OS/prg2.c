#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>

int main(){
	int fd,size;
	char filename[20],buffer[1000];
	
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fd=open(filename,O_RDONLY);
	
	if(fd<0){
		printf("Failed to open file\n");
		exit(0);
	}
	
	size=read(fd,buffer,sizeof(buffer));
	if(size<0){
		printf("Read error\n");
		exit(0);
	}
	
	printf("Contents of the file are: \n%s",buffer);
	close(fd);
	return 0;
}
