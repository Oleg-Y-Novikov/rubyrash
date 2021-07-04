#программа просит ввести слово для проверки является ли оно палиндромом или нет
puts "Введите слово для проверки:"
original_string = gets.chomp.strip.downcase
stripped_string = original_string.delete(",.?")
puts stripped_string
reverse_string = stripped_string.reverse
if reverse_string == stripped_string
  puts "Да, это палиндром"
else
  puts "Нет, это не палиндром"
end


# encoding: utf-8
#
# Программа, проверяющая палиндром введенное слово или нет, версия 2, в котрой
# можно вводить строку с пробелами.

# Спрашиваем у пользователя строку и записываем её в переменную original_string
puts 'Введите строку, которую надо проверить на «палиндромность»:'
original_string = STDIN.gets.encode('UTF-8').chomp

# Удаляем из строки все пробелы методом delete. В скобках этот метод принимает
# строку из всех символов, которые нужно удалить. Бонусом можно было удалить все
# знаки препинания (мы — не будем). Потом переводим строку в нижний регистр.
stripped_string = original_string.delete(' ,.!?;:—-').downcase

# Получаем перевернутую строку и записываем её в переменную reverse_string.
reverse_string = stripped_string.reverse

# Сравниваем перевернутую строку с той, которая в переменной stripped_string,
# если они совпали, это палиндром.
if reverse_string == stripped_string
  puts 'Да, это палиндром'
else
  puts 'Нет, это не палиндром'
end