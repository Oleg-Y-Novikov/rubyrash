current_path = File.dirname(__FILE__)
puts "Введите название файла который хотите открыть:"
name_file = gets.chomp
file_path = current_path + "/#{name_file}"

if File.exist?(file_path)
  f = File.new(file_path, "r")
  puts "Открыли фаил: #{name_file}"
  lines = f.readlines
  f.close
  #size = 0 #lines.length
  empty_string = 0
  lines.each do |item|
    if item == "\n"
      empty_string += 1
    #else
      #size += 1
    end
  end
  puts "Всего строк: #{lines.length}"
  puts "Пустых строк: #{empty_string}"
  puts "Последние 5 строк файла:"
  puts lines.last(5)
else
  puts "Фаил не найден"
end