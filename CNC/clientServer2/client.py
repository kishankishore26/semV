import socket 

cs=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

expr=input("Enter an expression: ")
strexpr=str.encode(expr)
cs.sendto(strexpr,('localhost',8888))
msg=cs.recvfrom(1024)
print("Result: ",msg[0].decode())
cs.close()
