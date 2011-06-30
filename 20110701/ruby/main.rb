puts "input origina filename"
originFile = gets
puts"input original string"
origins = gets
puts"input chenged string"
changes = gets
puts"input new filename"
newFileName = gets

r = File.open(originFile)
w = open(newFileName,"w")

while line = f.gets
    line = line.gsub(origins,changes)
    w.puts line
end

r.close
w.close

