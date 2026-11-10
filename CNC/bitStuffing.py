msg=input("Enter the data bits: ")
flag="01111110"
print(f"Sender message: {msg}")

frames=""
count=0
for b in msg:
	frames+=b
	if b=="1":
		count+=1
	else: 
		count=0
	if count==5:
		count=0
		frames+="0"
frames=flag+frames+flag

print(f"Sender data after bit stuffing: {frames}")

count=0
data=frames[8:-8]
result=""
i=0

while i<len(data):
	result+=data[i]
	if data[i]=="1":
		count+=1
	else:
		count=0
	if count==5:
		count=0
		i+=1
	i+=1
print(f"Receiver data after bit unstuffing: {result}")	
	
