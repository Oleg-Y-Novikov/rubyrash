loop do
  puts "Введите число или строку для подсчета байтов"
  user_input = gets.chomp

  if user_input.to_i.zero?
    puts "В строке \"#{user_input}\" - #{user_input.bytesize} байт"
  else
    puts "В числе \"#{user_input}\" - #{user_input.to_i.size} байт"
  end
end
