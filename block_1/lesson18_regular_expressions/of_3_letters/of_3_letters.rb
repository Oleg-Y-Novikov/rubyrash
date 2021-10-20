=begin
current_path = File.dirname(__FILE__)
file_path = current_path + "/data/saving_read_YAML.txt"

count = 0

if File.exist?(file_path)
  file = File.open(file_path, "r")
  text = file.read
  file.close
  array = text.scan(/[[:word:]]+/)
  array.each do |word|
    if word.size == 3
      count += 1
    end
  end
else
  puts "Фаил не найден"
end
puts count
=end

current_path = File.dirname(__FILE__)
file_path = current_path + "/data/saving_read_YAML.txt"

count = 0

if File.exist?(file_path)
  file = File.open(file_path, "r")
  text = file.read
  file.close
  cleaned_text = text.gsub(/[,0-9\(\)\.\-;·:\?\!|"'=>#\[\]\/{}]/, ' ')
  words = cleaned_text.split
else
  puts "Фаил не найден"
end
puts words.count { |w| w =~ /^\S{3}$/ }