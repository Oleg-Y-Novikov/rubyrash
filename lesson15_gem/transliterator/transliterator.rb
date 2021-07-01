require 'translit'

puts "введите текст для транслитерации:"
text = STDIN.gets.chomp

puts Translit.convert(text)