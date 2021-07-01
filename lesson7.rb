arr = ["камень", "ножницы", "бумага"]
user = ""
user_score = 0
comp_score = 0
while user != 3
  puts "введите вариант: 0 - камень, 1 - ножницы, 2 - бумага, 3 - выйти из игры"
  user = gets.chomp.to_i
  return puts "Неверное число. Введите число от 0 до 2" if user < 0 || user > 3
if user == 0
  user = "Камень"
elsif user == 1
  user = "Ножницы"
elsif user == 2 
  user = "Бумага"
else
  user = 3
  puts "Bay Bay!"
  return
end
comp = arr.sample.capitalize
puts "Вы выбрали: #{user}"
puts "Компьютер выбрал: #{comp}"

if user == "Камень" && comp == "Ножницы"
  user_score += 1
  puts "Вы выйграли! Счет #{user_score} : #{comp_score}"
  puts
elsif user == "Ножницы" && comp == "Бумага"
  user_score += 1
  puts "Вы выйграли! Счет #{user_score} : #{comp_score}"
  puts
elsif user == "Бумага" && comp == "Камень"
  user_score += 1
  puts "Вы выйграли! Счет #{user_score} : #{comp_score}"
  puts
elsif user == comp
  puts "Ничья! Счет #{user_score} : #{comp_score}"
  puts
else 
  comp_score += 1
  puts "Вы проиграли... :( Счет #{user_score} : #{comp_score}"
  puts
end
end