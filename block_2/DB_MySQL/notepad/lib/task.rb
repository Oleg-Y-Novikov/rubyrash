# Класс «Задача», разновидность базового класса «Запись»
class Task < Post
  INSERT = <<~SQL.strip
    INSERT INTO post (type, created_at, text, due_date) VALUES
    ('%<type>s','%<created_at>s', '%<text>s', '%<due_date>s')
  SQL

  SELECT = <<~SQL.strip
    SELECT * FROM post WHERE type = 'Task'
  SQL

  def initialize
    super
    @due_date = Time.now
  end

  def read_from_console
    puts 'Что надо сделать?'
    @text = gets.chomp

    puts 'К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, ' \
      'например 12.05.2003'
    input = gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    [deadline, @text, time_string]
  end

  def db_hash
    super.merge({ text: @text, due_date: @due_date.strftime("%Y-%m-%d %H:%M:%S") })
  end
end
