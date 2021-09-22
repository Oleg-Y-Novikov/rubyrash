# Программа, выбрасывающая значение от 1 до 6 — одну игральную кость, версия 3.
# Кость вращается при броске.
#
# (с) rubyrush.ru

# Напишем метод, который показывает вращающийся кубик. Для этого 100 раз с
# задержкой в 1 сотую секунды покажем произвольное число и сотрём её потом,
# добавив \r в конце.
def show_rolling_die
  100.times do
    # Вместо puts используем print, т.к. он не добавляет перенос строки в конце
    print "#{rand(6) + 1}\r" #\r Сам по себе возврат каретки предоставлял возможность печати новой строки поверх имеющейся.
    sleep 0.01
  end
end

def random_dice
  rand(6) + 1
end

puts 'How many dice?'
number = gets.to_i
puts

arr = []

number.times do
  # Вызываем метод вращения кубика
  show_rolling_die
  puts die = random_dice
  arr << die

end
puts "Sum of dice: #{arr.sum}"
