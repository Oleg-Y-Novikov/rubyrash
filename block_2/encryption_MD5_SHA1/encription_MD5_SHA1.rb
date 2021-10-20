#Шифрование MD5, SHA1
#Напишите программу, которая шифрует введённое пользователем слово одним из механизмов MD5 или SHA1.
require 'digest'

puts "Введите слово или фразу для шифрования:"
words = gets.chomp

puts "Каким способом зашифровать:"
puts "1. MD5"
puts "2. SHA1"
begin
  encryption = Integer(gets.chomp) 
rescue 
  puts "введите число"
  retry
end
encryption == 1 ? result = Digest::MD5.hexdigest(words) : result = Digest::SHA1.hexdigest(words)
puts "Вот что получилось:"
puts result
