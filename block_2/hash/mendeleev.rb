# Таблица, где символу элемента соответствует фамилия его первооткрывателя

table = {
  H: 'Кавендиш',
  He: 'Локьер, Жансен, Рамзай',
  Li: 'Арфведсон',
  Be: 'Воклен',
  B: 'Дэви и Гей-Люссак',
  C: 'неизвестен',
  N: 'Резерфорд',
  O: 'Пристли и Шееле',
  F: 'Муассан',
  Ne: 'Рамзай и Траверс'
}

puts "У нас есть всего элементов: #{table.keys.size}"
#print table.keys
str = ""
table.each_key {|k| str += "#{k}, "}
print str.chomp(", ")
puts

puts "О каком элементе хотите узнать?"
element = gets.chomp.to_sym

if table.has_key?(element)
  puts table[element]
else
  puts "Извините, про такой элемент мы еще не знаем."
end
