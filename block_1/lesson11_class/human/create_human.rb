require_relative "class_human"

person_1 = Human.new("Гаврила", "Петрович", 40)
person_2 = Human.new("Фёдор", "Петрович", 61)
person_3 = Human.new("Василий", "Алибабаевич", 59)

puts "У нас есть три человека:"
person_1.wats_you_name
person_2.wats_you_name
person_3.wats_you_name



#**********************************#

# encoding: utf-8

# Подключим класс Person из файла person.rb
require_relative 'person'

# Создадим трех людей
young_person = Person.new('Сергей', 'Михайлович', 41)
old_person = Person.new('Константин', 'Львович', 61)

# Выводим на экран имена и возраст наших людей
puts 'У нас есть два человека:'

# Вызываем у объектов класса Person по очереди все их методы: full_name, age,
# и old? и выводим на экран информацию на основе того, что получили.
puts young_person.full_name
puts "И ему #{young_person.age} — #{young_person.old? ? 'пожилой' : 'молодой'}"

puts old_person.full_name
puts "И ему #{old_person.age} — #{old_person.old? ? 'пожилой' : 'молодой'}"