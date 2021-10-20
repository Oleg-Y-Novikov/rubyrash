class Aplication

  def self.run
    new.run
  end

  def initialize
    @my_mail = ""
    @password = ""
    @send_to = ""
    @body = ""
    @subject = ""
    @config = {}
  end

public

  def run
    loop do
      puts "Для выхода из программы введите exit"
      puts "Введите ваш адрес электронной почты:"
      @my_mail = gets.chomp
      break if @my_mail == "exit"
      puts "Введите пароль от вашей почты #{@my_mail} для отправки письма:"
      @password = gets.chomp
      break if @password == "exit"
      puts "Кому отправить письмо? Введите адрес:"
      @send_to = gets.chomp
      break if @send_to == "exit"
      puts "Тема письма:"
      @subject = gets.chomp
      break if @subject == "exit"
      puts "Что написать в письме?"
      @body = gets.chomp.encode("UTF-8")
      break if @body == "exit"

      @config = {
        :subject => @subject,
        :body => @body,
        :to => @send_to,
        :from => @my_mail,
        :via => :smtp,
        :via_options => {
          :address => 'smtp.mail.ru',
          :port => '465',
          :tls => true,
          :user_name => @my_mail,
          :password => @password,
          :authentication => :plain
        }
      }
      File.open("config.yml", "w") { |file| file.write(@config.to_yaml) }

      puts "Всё готово. Отправить ваше сообщение? Введите yes или no"
      user_input = gets.chomp
      if user_input == "yes"
        yaml_file = YAML.load(File.read("config.yml"))
        Pony.mail(yaml_file)
        puts "Сообщение отправлено!"
      else
        puts "Сообщение не отправлено"
      end
    end
  end

private

  def password

  end

end