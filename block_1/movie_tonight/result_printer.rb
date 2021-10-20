class ResultPrinter

  def printer(films)
    puts "Сегодня Вам предлагается к просмотру фильм:"
    films.generate_films
  end

end