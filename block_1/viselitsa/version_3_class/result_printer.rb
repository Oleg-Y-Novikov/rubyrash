class ResultPrinter
  
  def print_status(game)

    clear

    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)

    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)


    if game.errors >= 7
      puts "Вы проиграли :("
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
    case errors
    when 0
      puts '
          _______
          |/
          |
          |
          |
          |
          |
          |
          |
        __|________
        |         |
        '
    when 1
      puts '
        _______
        |/
        |     ( )
        |
        |
        |
        |
        |
        |   |-----|
      __|___|_____|
      |         |
      '
    when 2
      puts '
        _______
        |/
        |     ( )
        |      |
        |
        |
        |
        |
        |   |-----|
      __|___|_____|
      |         |
      '
    when 3
      puts '
        _______
        |/
        |     ( )
        |      |_
        |        \\
        |
        |
        |
        |   |-----|
      __|___|_____|
      |         |
      '
    when 4
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    /   \\
        |
        |
        |
        |   |-----|
      __|___|_____|
      |         |
      '
    when 5
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    / | \\
        |      |
        |
        |
        |   |-----|
      __|___|_____|
      |         |
      '

    when 6
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    / | \\
        |      |
        |     / \\
        |    /   \\
        |   |-----|
      __|___|_____|
      |         |
      '
    when 7
      puts '
        _______
        |/     |
        |     (_)
        |     _|_
        |    / | \\
        |      |
        |     / \\
        |    /   \\
        |
      __|________   _____
      |         |   |   |
      '
    end
  end
end