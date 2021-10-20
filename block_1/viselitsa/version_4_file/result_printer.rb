class ResultPrinter
  
  def initialize(slovo)
    @status_image = []
    @slovo = slovo

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7
      file_name = current_path + "/image/#{counter}.txt"

      if File.exist?(file_name)
        file = File.new(file_name, "r")
        @status_image << file.read
        file.close
      else
        @status_image << "\n [ изображение не найдено ] \n"
      end

      counter += 1
    end
  end
  
  def print_status(game)

    clear

    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)

    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)


    if game.errors >= 7
      puts "Вы проиграли :("
      puts "Было загадано слово: #{@slovo}"
    else
      if game.letters.uniq.size == game.good_letters.size
        puts "Поздравляем! Вы выйграли!\n\n"
      else
        puts "У вас осталось попыток: " + (7 - game.errors).to_s
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    for letter in letters
      if good_letters.include? letter
        result += letter + " "
      else
        result += "__ "
      end
    end

    return result
  end

  def clear
    system "clear" or system "cls"
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end