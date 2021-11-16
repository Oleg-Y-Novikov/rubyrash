# Подключаем необходимые нам библиотеки json и date
require 'json'

file = File.read("#{__dir__}/languages.json", encoding: 'utf-8')
card = JSON.parse(file)

arr = card.to_a.sort! { |ar1, ar2| ar2[1] <=> ar1[1] }

puts "Самый популярный язык: #{arr[0][0]} (#{arr[0][1]})"

card = arr.to_h
item = 1
card.each do |k, v|
  puts "#{item}: #{k} (#{v})"
  item += 1
end
