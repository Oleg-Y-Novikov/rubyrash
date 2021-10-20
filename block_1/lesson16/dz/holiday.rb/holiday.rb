# encoding: utf-8

# Записываем текущее время в переменную time
time = Time.now

# Получаем текущий день недели, вызывая у объекта в переменной time метод wday
week_day = time.wday
today = time.strftime("%Y-%m-%d")

route = File.dirname(__FILE__) + "/holiday.txt"
if File.exist?(route)
  file = File.open(route, "r")
  holiday_array = file.readlines
  file.close
  holiday_array.map!(&:chomp)
else
  puts "Фаил по пути #{route} не найден"
end
# Проверяем номер дня недели (дни нумеруются с нулевого, при этом первый день
# недели - воскресенье, а последний, 6-й - суббота)
if week_day == 0 || week_day == 6
  puts "Сегодня выходной!"
  exit
end

if holiday_array.include?(today)
  puts "Сегодня государственный праздник"
else
  puts "Сегодня будний день, за работу!"
end