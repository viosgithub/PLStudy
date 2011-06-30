import sys

inputFile=open(sys.argv[1],'r')
outputFile=open(sys.argv[2],'w')
for line in inputFile:
    line = line.replace(sys.argv[3],sys.argv[4])
    outputFile.write(line)
