require_relative "methods.rb"

clear

puts "Игра виселица версия 1"

letters = get_letters

errors = 0
bad_letters = []
good_latters = []

while errors < 7
  print_status(letters, good_latters, bad_letters, errors)

  puts "введите след. букву"

  user_input = get_user_input
  

  result = check_result(user_input, letters, good_latters, bad_letters)
  
  if result == -1
    errors += 1
  elsif result == 1
    break
  end
end

print_status(letters, good_latters, bad_letters, errors)