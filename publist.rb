#!/usr/bin/env ruby


if ARGV.length < 1
	puts "Please enter a path ./example/: "
	dir = $stdin.gets.chomp
else
	dir = ARGV[0]
end

if ARGV.length < 2
	puts "Please enter a date YYYYMMDD: "
	date = $stdin.gets.chomp.to_i	
	#date = 20111202
else 
	date = ARGV[1].to_i
end

if ARGV.length < 3
	puts "Please enter a time HHMMSS: "
	time = $stdin.gets.chomp.to_i
else 
	time = ARGV[2].to_i
end

#dir = "./sample/"
#time = 94602
#date = 20111202

links_array = Array.new

Dir.foreach(dir) do |entry|
  
  unless entry == "." or entry == ".." or entry == ".DS_Store"
  
  	file_name = entry.gsub(/\s+/, "").split(/_/)
	 	
  	if file_name[3].to_i >= date and file_name[4].to_i >= time
  	
  		#puts "\nFile name: " + entry
  		#puts "Beginning of file *******************************************"
  		file = File.open(dir + entry)
		while (line = file.gets)
			#puts line
			links_array.push line unless /^#/.match(line) or line=="\n"
 	 	end
		#puts "End of file *************************************************\n"
	
	
	end
	
  end
  
end

#puts links_array.sort.uniq
puts "\n\n\n"
puts "Number of links found: #{links_array.length}" 

puts links_array.sort.uniq