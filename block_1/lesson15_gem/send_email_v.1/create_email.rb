class CreateEmail
  
  attr_reader :my_mail, :password, :send_to, :body, :subject

  def initialize
    puts "Введите свою почту:"
    @my_mail = STDIN.gets.chomp
    puts "Введите пароль от вашей почты #{@my_mail} для отправки письма:"
    @password = STDIN.noecho(&:gets).chomp
    puts "Кому отправить письмо? Введите адрес:"
    @send_to = STDIN.gets.chomp
    puts "Что написать в письме?"
    @body = STDIN.gets.chomp
    puts "Тема письма:"
    @subject = STDIN.gets.chomp
  end

end