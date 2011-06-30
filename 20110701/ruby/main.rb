puts "input origina filename"
originFile = gets.chomp
puts"input original string"
origins = gets.chomp
puts"input chenged string"
changes = gets.chomp
puts"input new filename"
newFileName = gets.chomp

w = open(newFileName,"w")
r = open(originFile)
while line = r.gets
    w.write(line.gsub(origins,changes))
end

