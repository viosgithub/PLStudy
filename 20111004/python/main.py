class Shape():
	def __init__(self,name):
		self.name = name
		self.stat = []
class Problem():
	def __init__(self,operations,shapes):
		self.operations = operations
		self.shapes = shapes
		for i in range(len(operations)):
			self.cancel(operations[i],i)
		for i in range(len(operations)):
			self.sousa(operations[i],i)



	def cancel(self,opp,onum):
		if opp == "bcancel":
			print "bcancel"
			self.operations[onum-1] = "nop"
		elif opp == "ncancel":
			print "ncancel"
			self.operations[onum+1] = "nop"
	def sousa(self,opp,snum):
		if opp == "jouge":
			print "jouge",snum
			self.shapes[snum].stat.append("jouge")
		elif opp == "sayuu":
			print "sayuu",snum
			self.shapes[snum].stat.append("sayuu")
		elif opp == "cnext":
			print "cnext",snum
			self.shapes[snum+1].stat.append("clear")
		elif opp == "cbefore":
			print "bnext",snum
			self.shapes[snum-1].stat.append("clear")
		elif opp == "bchange":
			print "bchange",snum
			self.shapes[snum-1],self.shapes[snum] = self.shapes[snum],self.shapes[snum-1]
		elif opp == "nop":
			print "nop"
		elif opp == "bcancel":
			pass
		elif opp == "ncancel":
			pass
		elif opp == "reverse":
			print "reverse"
			self.shapes.reverse()
		elif opp == "reverse2":
			print "reverse2"
			self.shapes[0],self.shapes[2] = self.shapes[2],self.shapes[0]
			self.shapes[1],self.shapes[3] = self.shapes[3],self.shapes[1]
		elif opp == "reverse3":
			print "reverse3"
			self.shapes[0],self.shapes[1] = self.shapes[1],self.shapes[0]
			self.shapes[2],self.shapes[3] = self.shapes[3],self.shapes[2]

			

		else :
			print "not such a operations"

s = [Shape("1"),Shape("2"),Shape("3"),Shape("4")]
o = ["sayuu","bchange","jouge","bchange","reverse"]
p = Problem(o,s)

for s in p.shapes:
	print s.name,s.stat

