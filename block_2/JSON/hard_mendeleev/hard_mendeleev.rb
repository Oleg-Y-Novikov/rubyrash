require 'json'

file = File.read("#{__dir__}/elements.json")

table = JSON.parse(file)
p table
puts "У нас есть всего элементов: #{table.keys.size}"
puts table.keys.join(', ')
# puts table.keys.to_s
puts

puts "О каком элементе хотите узнать?"
element = gets.chomp

if table.key?(element)
  table[element].each do |k, v|
    puts "#{k.capitalize}: #{v}"
  end
else
  puts "Извините, про такой элемент мы еще не знаем."
end
