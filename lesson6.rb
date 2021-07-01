secret_number = rand(17)
puts "Загадано число от 0 до 16, отгадайте какое?"
user_num = gets.chomp.to_i
if user_num == secret_number
  puts "Ура, вы выиграли!"
  exit
elsif (user_num - secret_number).abs <= 2 && user_num > secret_number
  puts "Тепло, нужно меньше"
elsif (user_num - secret_number).abs <= 2 && user_num < secret_number
  puts "Тепло, нужно больше"
  
elsif (user_num - secret_number).abs >= 3 && user_num > secret_number
  puts "Холодно, нужно меньше"
elsif (user_num - secret_number).abs >= 3 && user_num < secret_number
  puts "Холодно, нужно больше"
end

user_num = gets.chomp.to_i
if user_num == secret_number
  puts "Ура, вы выиграли!"
  exit
elsif (user_num - secret_number).abs <= 2 && user_num > secret_number
  puts "Тепло, нужно меньше"
elsif (user_num - secret_number).abs <= 2 && user_num < secret_number
  puts "Тепло, нужно больше"
  
elsif (user_num - secret_number).abs >= 3 && user_num > secret_number
  puts "Холодно, нужно меньше"
elsif (user_num - secret_number).abs >= 3 && user_num < secret_number
  puts "Холодно, нужно больше"
end

user_num = gets.chomp.to_i
if user_num == secret_number
  puts "Ура, вы выиграли!"
  exit
else
  puts "Вы не угадали, было загадано число #{secret_number}" 
end