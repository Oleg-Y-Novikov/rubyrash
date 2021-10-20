puts 'Врага какого персонажа (Бэтмен, Шерлок Холмс, Буратино, Фродо Бэггинс, Моцарт) вы хотите узнать?'

hero = gets.chomp.split(" ")

hero.map! { |word| word.capitalize }
hero = hero.join(" ")
case hero
when "Бэтмен", "Betman" then puts "Джокер!"
when "Шерлок Холмс", "Sherlock Holmes" then puts "Профессор Мориарти"
when "Буратино", "burattino" then puts "Карабас-Барабас"
when "Фродо Бэггинс", "Frodo Baggins" then puts "Саурон"
when "Моцарт", "Mozart" then puts "Сальери"
else
  puts "Не удалось найти врага."
end

#https://rubyrush.ru/articles/ruby-case-examples