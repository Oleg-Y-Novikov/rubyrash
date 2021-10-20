require_relative "movie_class"

puts "Фильмы какого режиссера Вы хотите посмотреть?"

director = gets.chomp
array = []
3.times do 
  puts "Какой-нибудь его хороший фильм?"
  title = gets.chomp
  movie = Movies.new(title, director)
  array << movie
end
film = array.sample
puts "И сегодня вечером рекомендую посмотреть: #{film.title}"
puts "Режиссера: #{film.director}"