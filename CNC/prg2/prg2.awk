BEGIN{
	tcount=0;
	ucount=0;
	stime=0;
	ftime=0;
	psize=0;
	latency=0;
	throughput=0;
}
{
	if($4=="3" && $1=="r"){
		psize+=$6;
		if(stime==0){
			stime=$2;
		}
		ftime=$2;
	}
	if($5=="tcp"){
		tcount++;
	}else if($5=="cbr"){
		ucount++;
	}
}
END{
	printf("No.of TCP packets sent: %d\n",tcount);
	printf("No.of UDP packets sent: %d\n",ucount);
	
	latency=ftime-stime;
	throughput=(psize/latency)*(8/1000);
	printf("Latency: %dms\n",latency);
	printf("Throughput: %dMb\n",throughput);
}
	
