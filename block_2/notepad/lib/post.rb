# encoding: utf-8
#
# Базовый класс «Запись» — здесь мы определим основные методы и свойства,
# общие для всех типов записей.
class Post
  # Метод post_types класса Post, возвращает всех известных ему детей класса
  # Post в виде массива классов.
  #
  # Обратите внимание, что класс, объявленный с self. перед название — это не
  # метод экземпляра класса, а метод самого класса (их ещё часто называют
  # статические методы).
  def self.post_types
    [Memo, Task, Link]
  end

  # Строго говоря этот метод self.types не очень хорош — код родительского
  # класса в идеале не должен никак зависеть от того, какие у него дети. Мы его
  # использовали для простоты (адекватно поставленной задаче).
  #
  # В сложных приложениях это делается немного иначе: например отдельный класс
  # владеет всей информацией, и умеет создавать нужные объекты (т. н. шаблон
  # проектирования «Фабрика»).
  #
  # Или каждый дочерний класс динамически регистрируется в подобном массиве
  # сам во время загрузки программы.
  #
  # Подробнее об этом вы можете прочитать в книгах о паттернах проектирования,
  # ссылки на которых приведены в дополнительных материалах.

  # Метод create класса Post динамически (в зависимости от параметра) создает
  # объект нужного класса (Memo, Task или Link) из набора возможных детей,
  # получая список с помощью метода post_types, объявленного выше.
  def self.create(type_index)
    post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def read_from_console
    # Этот метод должен быть реализован у каждого ребенка
  end

  def to_strings
    # Этот метод должен быть реализован у каждого ребенка
  end

  def save
    file = File.new(file_path, 'w:UTF-8') # открываем файл на запись

    to_strings.each { |string| file.puts(string) }

    file.close
  end

  def file_path
    case self.class.name
    when "Link" then current_path = File.dirname(__FILE__) + "/../link"
    when "Memo" then current_path = File.dirname(__FILE__) + "/../memo"
    when "Task" then current_path = File.dirname(__FILE__) + "/../task"
    else current_path = File.dirname(__FILE__)
    end

    file_time = @created_at.strftime('%Y-%m-%d_%H-%M-%S')

    "#{current_path}/#{self.class.name}_#{file_time}.txt"
  end
end
