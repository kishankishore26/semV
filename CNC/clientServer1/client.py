import socket
cs=socket.socket()

print("Client connecting to server")
cs.connect(('localhost',6666))
cs.send(input("Enter the filename: ").encode())
fileContents=cs.recv(1024).decode()
print(fileContents)
