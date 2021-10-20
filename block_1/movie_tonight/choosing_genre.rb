class ChoosingGenre

  def initialize
    @genre_array = ["best_films", "comedy", "history"]
  end

  def choosing_a_genre
    puts "Введите число соответствующее жанру: 0 - лучшие фильмы, 1 - комедии, 2 - историческое"
    user_input = gets.chomp.to_i
    @genre_array[user_input]
  end
end