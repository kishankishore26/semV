import random

msg=input("Enter the messsage: ")
frames=[[i//3+1,msg[i:i+3]] for i in range(0,len(msg),3)]
print("Original frames: ",frames)

random.shuffle(frames)
print("Shuffled frames: ",frames)

for i in range(len(frames)):
	for j in range(len(frames)-i-1):
		if frames[j][0]>frames[j+1][0]:
			frames[j],frames[j+1]=frames[j+1],frames[j]
print("Sorted frames: ",frames)

result="".join(f[1] for f in frames)
print("Result frame: ",result)
