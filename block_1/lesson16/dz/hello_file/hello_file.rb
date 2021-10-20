puts "программа пишет пользовательский ввод в фаил \"./data/file.txt\""
puts "введите end для завершения ввода"
puts "Введите, что хотите записать в фаил:"
user_input = nil
array = []

while user_input != "end"
  user_input = STDIN.gets.chomp
  array << user_input
end
array.pop
current_path = File.dirname(__FILE__)
rout = current_path + "/data/file.txt"

file = File.new(rout, "a+")
file.puts(array)
file.close
puts "данные записанны в фаил!"