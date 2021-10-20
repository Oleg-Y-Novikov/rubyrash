def clear
  system "clear"
end


def get_letters
  slovo = ARGV[0]
  if slovo == nil || slovo == ""
    abort "Вы не ввели слово для игры"
  end

  return slovo.split("")
end

def get_user_input
  letter = ""

  while letter == ""
    letter = STDIN.gets.chomp
  end

  return letter
end

def check_result(user_input, letters, good_latters, bad_letters)
  if good_latters.include?(user_input) || bad_letters.include?(user_input)
    return 0
  end
  
  if letters.include? user_input
    good_latters << user_input

    if letters.uniq.size == good_latters.size
      return 1
    else 
      return 0
    end
  else
    bad_letters << user_input
    return -1
  end
end

def get_word_for_print(letters, good_latters)
  result = ""
   
    for letter in letters
      if good_latters.include? letter
        result += letter + " "
      else
        result += " __ "
      end
    end
  return result
end


# 1. выводить загаданное слово (как в поле чудес)
# 2. информацию об ошибках и уже названные буквы
# 3. ошибок > 7 - сообщить о поражении
# 4. слово угадано - сообщить о победе
def print_status(letters, good_latters, bad_letters, errors)
  puts "\nСлово: " + get_word_for_print(letters, good_latters)

  puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

  if errors >= 7
    puts "Вы проиграли :("
  else
    if letters.uniq.size == good_latters.size
      puts "Поздравляем! Вы выйграли!\n\n"
    else
      puts "У вас осталось попыток: " + (7 - errors).to_s
    end
  end
end
