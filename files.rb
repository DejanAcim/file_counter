directory_name = "sublime_text_3"

file_data = Dir.glob(File.join(directory_name, "**", "*.*")).inject({}) do |hash, file_name|
	ext = File.extname(file_name)
	hash[ext] ||= 0
	hash[ext] += 1
	hash
end

File.open("raport.txt", "w") do |file|
	file_data.each do |k, v|
		file.puts "#{k}\t#{v}"
	end
end
