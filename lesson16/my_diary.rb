puts "Привет, я твой дневник. Скажи мне что у тебя на уме и в душе?"
puts "Я сохраню всё, что ты напишешь до строчки \"end\" в файл."

line = nil
all_lines = []

while line != "end"
  line = STDIN.gets.chomp
  all_lines << line
end

all_lines.pop

time = Time.now

file_name = time.strftime("%Y-%m-%d")

time_string = time.strftime("%H:%M")

current_path = File.dirname(__FILE__) + "/data/#{file_name}.txt"

separator = "**************************"

file = File.new(current_path, "a")
file.print("\n#{time_string}\n")

for item in all_lines
  file.puts(item)
end

file.puts(separator)
file.close

puts "Ваша запись сохранена в файле #{file_name}.txt"
puts "Запись сделана в #{time_string}" 