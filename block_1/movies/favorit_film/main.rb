require_relative "class_human"
require_relative "class_movie"

person_1 = Human.new("Гаврила", "Петрович", 40)
person_2 = Human.new("Фёдор", "Петрович", 61)
person_3 = Human.new("Василий", "Алибабаевич", 59)


person_1.favorit_movie = Movies.new('Челюсти', 'Спилберг')
person_2.favorit_movie = Movies.new('Список Шиндлера', 'Спилберг')
person_3.favorit_movie = Movies.new('Парк Юрского периода', 'Спилберг')


person_1.wats_you_name
puts "с любимым фильмом: #{person_1.favorit_movie.title}"

puts

person_2.wats_you_name
puts "с любимым фильмом: #{person_2.favorit_movie.title}"

puts

person_3.wats_you_name
puts "с любимым фильмом: #{person_3.favorit_movie.title}"

puts

puts 'Все любят Спилберга!'