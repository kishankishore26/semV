import socket,re

ss=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

ss.bind(('localhost',8888))
print("Server binded to its address: ",ss.getsockname())
while(True):
	bytesAddressPair=ss.recvfrom(1024)
	expression=bytesAddressPair[0].decode()
	clientAddress=bytesAddressPair[1]
	
	num1,num2=re.split(r'\+|-|\*|/|%',expression.replace(' ',''))
	num1=float(num1)
	num2=float(num2)
	result=0
	
	if '+' in expression:
		result=num1+num2
	elif '-' in expression:
		result=num1-num2
	elif '*' in expression:
		result=num1*num2
	elif '%' in expression:
		result=num1%num2
	elif '/'in expression:
		if num2==0:
			result='Division by 0'
		else:
			result=num1/num2
	else:
		result='Invalid operator'
	
	print("Expression from client ",clientAddress,": ",expression)
	print("Result to client: ",clientAddress)
	ss.sendto(str(result).encode(),clientAddress)
ss.close()
