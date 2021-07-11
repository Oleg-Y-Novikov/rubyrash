class Game
  
  def self.run
    new.run
  end
  
  attr_reader :letters, :good_letters, :bad_letters, :status, :errors, :slovo
  
  def initialize
    @slovo = WordReader.new.read_from_file
    @letters = get_letters
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
    @printer ||= ResultPrinter.new(slovo)
  end

  def run
    while status == 0 
  
      @printer.print_status(self)
    
      ask_next_letter
    end
    
    @printer.print_status(self)
  end

  #def printer
    #@printer ||= ResultPrinter.new(slovo)
  #end

  def get_letters
    if @slovo == nil || @slovo == ""
      puts "Вы не ввели слово для игры!"
      @slovo = STDIN.gets.chomp
    end
    return @slovo.split("")
  end

  # 1. спросить букву в консоли
  # 2. проверить результат
  def ask_next_letter
    puts "\n Введите следующую букву"

    letter = ""

    while letter == ""
      letter = STDIN.gets.chomp
    end

    next_step(letter)
  end

=begin
  Метод next_step должен проверить наличие буквы
  в загаданном слове или среди уже названных букв
  (массивы @good_letters и @bad_latters)
  Аналог метода check_result в первой версии "Виселицы"
=end
  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      @good_letters << bukva

      if @good_letters.size == @letters.uniq.size
        @status = 1
      end
    
    else
      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

end 