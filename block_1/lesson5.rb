# Сгенерим случайное число от 0 до 10 тем же методом rand
if rand(11) == 10
  # Если случилось чудо и из 11 вариантов (0,1,2,3,4,5,6,7,8,9,10) выпал наибольший...
  puts 'Монета встала на ребро'
else
  # Если чуда не произошло, снова выбираем один из двух вариантов
  if rand(2) == 1
    puts 'Выпала решка'
  else
    puts 'Выпал орел'
  end
end

# Этот вариант решения далеко не единственный возможный.
# Как это обычно и бывает, программирование -- ремесло, похожее на искусство.


puts "Сколько сейчас стоит 1 доллар в рублях?:"
one = gets.chomp.to_f
puts "Сколько  у вас рублей?:"
two = gets.chomp.to_f

result = two / one

puts "Ваши запасы равны:$ #{result.round(2)}"


puts "Какая у вас на руках валюта?
1. Рубли
2. Доллары"
many = gets.chomp.to_i

if many == 1
  puts "Сколько у вас рублей?"
  rub_count = gets.chomp.to_f
  puts "Введите курс доллара по отношению к рублю:"
  dollor_count = gets.chomp.to_f

  result = rub_count / dollor_count
  puts "Ваши запасы на сегодня равны: $ #{result.round(2)}"
else many == 2
  puts "Сколько у вас доллоров?"
  dollor_count = gets.chomp.to_f
  puts "Введите курс доллара по отношению к рублю:"
  rub_count = gets.chomp.to_f

  result = dollor_count * rub_count
  puts "Ваши запасы на сегодня равны: #{result.round(2)} руб."
end