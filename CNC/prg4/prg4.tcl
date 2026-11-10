set ns [new Simulator]

set nf [open out.nam w]
$ns namtrace-all $nf

set tf [open out.tr w]
$ns trace-all $tf

proc finish {} {
	global ns tf nf
	$ns flush-trace
	close $tf
	close $nf
	exec nam out.nam & 
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]

$n0 color "blue"
$n0 label "source"

$n1 color "blue"
$n1 label "source"

$n6 color "red"
$n6 label "destination"

$n8 color "red"
$n8 label "destination"

$ns duplex-link $n7 $n8 10Mb 10ms DropTail
$ns duplex-link-op $n7 $n8 orient right
$ns queue-limit $n7 $n8 5

$ns make-lan "$n0 $n1 $n2 $n3 $n4 $n5 $n6 $n7" 100Mb 10ms LL Queue/DropTail Mac/802_3

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set tcpSink0 [new Agent/TCPSink]
$ns attach-agent $n8 $tcpSink0
$ns connect $tcp0 $tcpSink0
$tcp0 set packetSize_ 1000

set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1
set tcpSink1 [new Agent/TCPSink]
$ns attach-agent $n6 $tcpSink1
$ns connect $tcp1 $tcpSink1
$tcp1 set packetSize_ 1000

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 0.5 "$ftp0 start"
$ns at 5.0 "$ftp0 stop"
$ns at 5.5 "$ftp0 start"
$ns at 12.0 "$ftp0 stop"

set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 1.0 "$ftp1 start"
$ns at 6.0 "$ftp1 stop"
$ns at 7.0 "$ftp1 start"
$ns at 14.0 "$ftp1 stop"

$ns at 15.0 "finish"

set file0 [open file0.tr w]
$tcp0 attach $file0

set file1 [open file1.tr w]
$tcp1 attach $file1

$tcp0 trace cwnd_
$tcp1 trace cwnd_

$ns run
