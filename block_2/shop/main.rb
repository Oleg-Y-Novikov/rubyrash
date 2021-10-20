require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'



#params = {title: "title", genre: "genre", author: "author", price: "price", amount: "amount"}
#Movie.new(params)

#Product.products.each {|ell| ell.each_movies {|e| puts "Hello #{e}"}} 

loop do
  puts "Для добавления книги введите 1, для фильма введите 2, для выхода введите 0:"
  choice = gets.chomp.to_i
  break if choice == 0
  if choice == 1
    print "Введите название книги: "
    title = gets.chomp
    print "Введите жанр: "
    genre = gets.chomp
    print "Введите автора: "
    author = gets.chomp
    print "Введите цену: "
    price = gets.chomp
    print "Введите колличество: "
    amount = gets.chomp
    puts
    params = {title: title, genre: genre, author: author, price: price, amount: amount}
    Book.new(params)
  elsif choice == 2
    print "Введите название фильма: "
    title = gets.chomp
    print "Введите год выхода: "
    year = gets.chomp
    print "Введите режиссера: "
    director = gets.chomp
    print "Введите цену: "
    price = gets.chomp
    print "Введите колличество: "
    amount = gets.chomp
    puts
    params = {title: title, year: year, director: director, price: price, amount: amount}
    Movie.new(params)
  else
    puts "Неизвестная команда"
  end
end

puts "Вот какие товары у нас есть:"
Product.products.sort {|a,b| a.class.name <=> b.class.name }.each { |product| puts product.to_s }

puts "Всего книг - #{Book.books}"
puts "Всего фильмов - #{Movie.movies}"
