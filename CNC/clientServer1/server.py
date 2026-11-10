import os 
import socket

ss=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
ss.bind(('localhost',6666))
print("Server listening to connection")
ss.listen(1)

while(True):
	clientSocket,clientAddress=ss.accept()
	print("Accepted connection from address: ",clientAddress)
	filename=clientSocket.recv(1024).decode()
	print("Received filename: ",filename)
	if os.path.exists(filename):
		file=open(filename,'rb')
		fileContents=file.read()
		clientSocket.send(fileContents)
	else:
		print("File Not Found".encode())
	clientSocket.close()
