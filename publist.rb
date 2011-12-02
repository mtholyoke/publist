#!/usr/bin/env ruby

#puts "Hello"


if ARGV[0]==""
	dir = "./sample/"
else
	dir = ARGV[0]
end

puts "\n\nShowing files on or after 20111202_094602 only\n\n"

#Dir.foreach("/Users/qudsia/Projects/publist/sample") do |entry|
Dir.foreach(dir) do |entry|
  unless entry == "." or entry == ".." or entry == ".DS_Store"
  
  	file_date = entry.gsub(/\s+/, "").split(/_/)
  	
  	
  	
  	if file_date[3].to_i >= 20111202 and file_date[4].to_i >= 94602
  	
  		puts "\nFile name: " + entry
  		puts "Beginning of file"
  		puts "*******************************************"
  		file = File.open(dir + entry)
		while (line = file.gets)
			puts line
 	 	end
	
		puts "*******************************************"
		puts "End of file\n"
	
	end
  end
end