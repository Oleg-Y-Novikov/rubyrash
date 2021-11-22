# Класс «Ссылка», разновидность базового класса «Запись»
class Link < Post
  INSERT = <<~SQL.strip
    INSERT INTO post (type, created_at, text, url) VALUES
    ('%<type>s','%<created_at>s', '%<text>s', '%<url>s')
  SQL

  SELECT = <<~SQL.strip
    SELECT * FROM post WHERE type = 'Link'
  SQL

  def initialize
    super
    @url = ''
  end

  def read_from_console
    puts 'Адрес ссылки (url):'
    @url = gets.chomp

    puts 'Что за ссылка?'
    @text = gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    [@url, @text, time_string]
  end

  def db_hash
    super.merge({ text: @text, url: @url })
  end
end
