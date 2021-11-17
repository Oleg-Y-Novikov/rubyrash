require 'json'

file = File.read("#{__dir__}/table.json")

table = JSON.parse(file)

puts "У нас есть всего элементов: #{table.keys.size}"
puts table.keys.join(', ')
# str = ""
# table.each_key { |k| str += "#{k}, " } # тот же результат что и table.keys.join(', ')
# print str.chomp(", ")
puts

puts "О каком элементе хотите узнать?"
element = gets.chomp

if table.key?(element)
  puts table[element]
else
  puts "Извините, про такой элемент мы еще не знаем."
end
