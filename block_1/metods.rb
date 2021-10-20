
def circle_square(radius)
  square = Math::PI * (radius ** 2)
  return square.round(3)
end

puts "Введите радиус круга:"
radius = gets.chomp.to_f
puts "Площадь первого круга: #{circle_square(radius)}"
puts "Введите радиус второго круга:"
radius = gets.chomp.to_f
puts "Площадь второго круга: #{circle_square(radius)}"


#*******************#

def array_first_elements(arg1, arg2)
  if arg1.size < arg2
    puts "Такого размера колбасы у нас нет!"
  else
    puts "Вот ваша колбаса:"
    print arg1.first(arg2)
  end
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
puts "Вот какая палка колбасы у нас есть:"
puts array.to_s
puts "Сколько первых элементов вам отрезать?"
num = gets.to_i
array_first_elements(array, num)

#*****************#
# Метод, который вернет новый массив, состоящий из первых number элементов
# массива array. Можно использовать готовый метод take класса Array
#
# http://www.ruby-doc.org/core-2.4.0/Array.html#method-i-take
#
# Но мы для тренировки напишем логику сами.
def first_elements(array, number)
  # Объявим пустой массив, куда будем записывать элементы нового массива
  result_array = []

  # Счетчик элементов и одновременное индекс в исходном массиве array,
  # который будет передан в метод
  counter = 0

  while counter < number
    # Проверка: если длина массива array оказалась меньше, чем число элементов,
    # которые мы хотим «забрать», то просто прерываем этот цикл
    if array.size <= counter
      break
    end

    # Кладем в конечный массив число, которое находится в массиве array на
    # позиции counter
    result_array << array[counter]

    counter += 1
  end

  # Вернем нужный массив
  return result_array
end

# Создадим переменную original_array, в которую запишем исходный массив
original_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

# Выведем массив пользователю
puts 'Вот какая палка колбасы у нас есть: '
puts original_array.to_s

# Спросим у пользователя, сколько элементов ему нужно и запишем это в переменную
# number, предварительно преобразовав к числу
puts 'Сколько первых элементов вам отрезать?'
number = gets.to_i

# Выведем пользователю нужное количество элементов, используя наш метод
puts 'Вот ваша колбаса:'
puts first_elements(original_array, number).to_s