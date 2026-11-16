#include<stdio.h>
#include<stdlib.h>
#include<semaphore.h>
#include<unistd.h>
#include<pthread.h>
#include<sys/wait.h>
#define size 5

int buffer[size];
int in=0,out=0;

sem_t mutex,empty,full;

void *producer(void *args){
	int nextItem;
	for(int i=0;i<10;i++){
		nextItem=i+1;
		sem_wait(&mutex);
		sem_wait(&empty);
		buffer[in]=nextItem;
		in=(in+1)%size;
		printf("Produced an item %d\n",nextItem);
		sem_post(&full);
		sem_post(&mutex);
		sleep(1);
	}
}

void *consumer(void *args){
	int nextItem;
	for(int i=0;i<10;i++){
		sem_wait(&full);
		sem_wait(&mutex);
		nextItem=buffer[out];
		out=(out+1)%size;
		printf("Consumed an item %d\n",nextItem);
		sem_post(&empty);
		sem_post(&mutex);
		sleep(2);
	}
}

int main(){
	pthread_t p,c,i;
	sem_init(&mutex,0,1);
	sem_init(&empty,0,size);
	sem_init(&full,0,0);
	pthread_create(&p,NULL,producer,NULL);
	pthread_create(&c,NULL,consumer,NULL);
	pthread_join(p,NULL);
	pthread_join(c,NULL);
	return 0;
}
