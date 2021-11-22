require 'mysql2'
require 'json'
require 'date'
require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'

def create
  puts 'Что хотите записать в блокнот?'
  choices = Post.post_types.keys

  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.to_i

  entry = Post.create(choices[choice])
  entry.read_from_console
  entry.save_db
  puts 'Ваша запись сохранена!'
end

def read
  puts 'Записи какого типа вы хотите получить?'
  print 'Memo, Link, Task, All: '
  type = gets.chomp.capitalize
  case type
  when 'Memo' then Memo.new.read_db
  when 'Link' then Link.new.read_db
  when 'Task' then Task.new.read_db
  when 'All' then Post.new.read_db
  else
    puts 'Записи такого типа не существует'
  end
end

def update
  attrs = {}
  puts "Введите id записи которую хотите обновить"
  attrs[:post_id] = gets.chomp
  puts "введите имя поля которое хотите обновить"
  attrs[:field] = gets.chomp
  puts "введите новое значение для поля"
  attrs[:value] = gets.chomp
  Post.new.update_db(attrs)
  puts "Запись обнавлена"
end

def delete
  attrs = {}
  puts 'Введите id записи которую хотите удалить'
  attrs[:post_id] = gets.chomp
  Post.new.delete_db(attrs)
  puts "Запись удалена"
end

puts 'Привет, я твой блокнот v2 (MySQL)!'
puts 'Какое дейстие хотите выполнить?'
actions = Post.post_action
actions.each_with_index do |action, index|
  puts "\t#{index}. #{action}"
end
action = gets.to_i

send actions[action]
