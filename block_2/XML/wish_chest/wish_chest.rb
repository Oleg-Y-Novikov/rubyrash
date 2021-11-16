# Подключаем парсер rexml и библиотеку date для эффективного использования дат
require 'rexml/document'
require 'date'

# Спросим у пользователя, на что он потратил деньги и сколько
puts 'В этом сундуке хранятся ваши желания.'
puts 'Чего бы вы хотели?'
desire_text = $stdin.gets.chomp

puts 'До какого числа вы хотите осуществить это желание?
(укажите дату в формате ДД.ММ.ГГГГ)'
deadline = STDIN.gets.chomp

if deadline == ''
  # Если пользователь ничего не ввёл, значит крайний срок сегодня. Создаем
  # объект класса Date, соответствующий сегодняшнему дню.
  deadline = Date.today
else
  # Если ввел, попробуем распарсить его ввод
  begin
    deadline = Date.parse(deadline)
  rescue ArgumentError
    # Если дата введена неправильно, перехватываем исключение и все равно
    # выбираем 'сегодня' с помощью метода today класса Date
    deadline = Date.today
  end
end

# Сначала получим текущее содержимое файла. И построим из него XML-структуру в
# переменной doc.
current_path = File.dirname(__FILE__)
file_name = current_path + '/wish_chest.xml'

file = File.new(file_name, 'r:UTF-8')
doc = nil

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => error
  # Если парсер ошибся при чтении файла, придется закрыть прогу :(
  puts 'XML файл похоже битый :('
  abort error.message
end

file.close

# Добавим желание в нашу XML-структуру в переменной doc

# Для этого найдём элемент desires (корневой)
desires = doc.elements.find('desires').first

# И добавим элемент командой add_element. Все аттрибуты пропишем с помощью
# параметра, передаваемого в виде ассоциативного массива.
desire = desires.add_element('desire', { 'deadline' => deadline.strftime('%Y.%m.%d') })

# А содержимое элемента меняется вызовом метода-сеттера text=
desire.text = desire_text

# Осталось только записать новую XML-структуру в файл методов write. В качестве
# параметра методу передаётся указатель на файл. Красиво отформатируем текст в
# файлике с отступами в два пробела.
file = File.new(file_name, 'w:UTF-8')
doc.write(file, 2)
file.close

puts 'Желание успешно сохранено'
