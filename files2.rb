require 'open-uri'

rows = File.open("raport.txt") { |f| f.readlines }.map { |e|
	e.chomp.split("\t")
}.sort_by { |e| e.last.to_i }.reverse.take(10)
puts rows.inspect

values = rows.map { |r| r.last }.join(",")
labels = rows.map { |r| r.first }.join("|")

url = "https://chart.googleapis.com/chart?cht=p&chds=a&chs=600x350&chl=#{labels}&chd=t:#{values}"
