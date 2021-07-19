class Aplication

  def self.run
    new.run
  end

  def run
    loop do
      puts "Для выхода из программы введите exit"
      puts "Кому отправить письмо? Введите адрес:"
      @send_to = gets.chomp
      break if @send_to == "exit"
      puts "Тема письма:"
      @subject = gets.chomp
      break if @subject == "exit"
      puts "Что написать в письме?"
      @body = gets.chomp.encode("UTF-8")
      break if @body == "exit"

      puts "Всё готово. Отправить ваше сообщение? Введите yes или no"
      user_input = gets.chomp
      if user_input == "yes"
        config = YAML.load(File.read("config.yml"))
        options = {subject: @subject, body: @body, to: @send_to}
        #yaml_file.each {|key, value| config[key] = value}
        #print config
        Pony.mail(config.merge(options))
        puts "Сообщение отправлено!"
      else
        puts "Сообщение не отправлено"
      end
    end
  end
end