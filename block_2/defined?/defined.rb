#Найдите в интернете способ выяснить объявлена ли переменная, и напишите программу, которая пишет, объявлены ли переменные a и b.

def my_defined?(variable)
    puts "Переменная определена => #{defined?(variable)}"
end

variable = 1
my_defined?(variable) rescue puts "Переменная НЕ определена => nil"

# Программа, которая показывает, где что определено
#
# (с) rubyrush.ru

# Объявим переменную a
a = 1

# Проверим, объявлена ли переменная a методом defined? (вернет local-variable)
if defined?(a)
  puts 'Переменная \'a\' определена'
else
  puts 'Переменная \'a\' не определена'
end

# Проверим, объявлена ли переменная b методом defined? (вернет nil)
if defined?(b)
  puts 'Переменная \'b\' определена'
else
  puts 'Переменная \'b\' не определена'
end