# frozen_string_literal: true

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/product_collection'


collection = ProductCollection.from_dir('./data')

collection.sort!(by: :price, order: :asc)

collection.products.each { |product| puts product }






=begin
# Считываем наши книгу и фильм из папок data/books и data/films соответственно
current_path = File.dirname(__FILE__)
film = Movie.from_file(current_path + '/data/films/leon.txt')
book = Book.from_file(current_path + '/data/books/idiot.txt')

# Выводим их на экран
puts film
puts book

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
  Product.from_file(current_path + '/data/films/01.txt')
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end
#params = { title: "title", genre: "genre", author: "author" }
#Movie.new(params)
#print Product.products


#Product.products.each {|ell| ell.each_movies {|e| puts "Hello #{e}"}}
=end
=begin
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
=end
