n=int(input("Enter number of routers: "))

cost=[]
via=[]

for i in range(n):
	row=[]
	for j in range(n):
		row.append(int(input()))
	cost.append(row)
	
	temp=[]
	for j in range(n):
		temp.append(j+1)
	via.append(temp)
	
for k in range(n):
	for i in range(n):
		for j in range(n):
			if cost[i][j]>cost[i][k]+cost[k][j]:
				cost[i][j]=cost[i][k]+cost[k][j]
				via[i][j]=via[i][k]

for i in range(n):
	print("\nDistance Table for Router: ",i+1)
	
	for j in range(n):
		print("Node ",j+1," Via ",via[i][j]," Distance ",cost[i][j])
		
