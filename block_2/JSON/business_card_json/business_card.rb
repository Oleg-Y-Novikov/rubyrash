# Подключаем необходимые нам библиотеки json и date
require 'json'

file = File.read("#{__dir__}/business_card.json", encoding: 'utf-8')
card = JSON.parse(file)

card.each { |key, value| puts "#{key}: #{value}" }
