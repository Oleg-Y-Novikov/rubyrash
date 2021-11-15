require 'rexml/document' # подключаем парсер
require 'date' # подключаем гем для работы с датами

file_path = "./my_expenses.xml"

abort "Фаил по пути #{file_path} не найден" unless File.exist?(file_path)

file = File.new(file_path)

doc = REXML::Document.new(file) # создаем объект парсера

file.close

amount_by_day = {}

# xml.elements.each(путь к тегам) do |элемент| - цикл по всем ЭЛЕМЕНТАМ xml дерева,
# лежащим по данному пути
doc.elements.each("expenses/expense") do |item|
  loss_sum = item.attributes["amount"].to_i # потраченная сумма, значение атрибута из xml
  loss_date = Date.parse(item.attributes["date"]) # дата покупки, значение атрибута date из xml

  amount_by_day[loss_date] ||= 0 # хэш, ключ дата покупки, значение сумма траты.
  amount_by_day[loss_date] += loss_sum # Сумма суммируется если в один день было несколько покупок
end

sum_by_month = {}
current_month = amount_by_day.keys.sort[0].strftime("%B %Y")

amount_by_day.keys.sort.each do |key|
  sum_by_month[key.strftime("%B %Y")] ||= 0
  sum_by_month[key.strftime("%B %Y")] += amount_by_day[key]
end

# выводим заголовок для первого месяца
puts "*****[ #{current_month}, всего потрачено #{sum_by_month[current_month]}p. ]*****"

amount_by_day.keys.sort.each do |key|
  if key.strftime("%B %Y") != current_month
    current_month = key.strftime("%B %Y")
    puts "*****[ #{current_month}, всего потрачено #{sum_by_month[current_month]}p. ]*****"
  end

  puts "\t#{key.day}: #{amount_by_day[key]}р."
end
