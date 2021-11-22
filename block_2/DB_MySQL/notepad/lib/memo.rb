# Класс «Заметка», разновидность базового класса «Запись»
class Memo < Post
  INSERT = <<~SQL.strip
    INSERT INTO post (type, created_at, text) VALUES
    ('%<type>s','%<created_at>s', '%<text>s')
  SQL

  SELECT = <<~SQL.strip
    SELECT * FROM post WHERE type = 'Memo'
  SQL

  def read_from_console
    puts 'Новая заметка (все, что пишите до строчки "end"):'

    line = nil
    until line == 'end'
      line = gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"
    @text.unshift(time_string)
  end

  def db_hash
    super.merge({ text: @text.join('\n\r') })
  end
end
