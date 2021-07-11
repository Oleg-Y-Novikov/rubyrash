loop do
  puts "Float калькулятор. Для выхода введите \'exit\'"
  puts "Введите первое число:"
  first_integer = STDIN.gets.chomp
  break if first_integer == "exit"

  until first_integer = Float(first_integer) rescue false
    puts "неверное значение, введите только число"
    first_integer = STDIN.gets.chomp
  end

  puts "Введите второе число:"
  second_integer = STDIN.gets.chomp
  break if second_integer == "exit"
  
  until second_integer = Float(second_integer) rescue false
    puts "неверное значение, введите только число"
    second_integer = STDIN.gets.chomp
  end
  
  puts "Выберите операцию (+ - * /)"
  operation = STDIN.gets.chomp
  break if operation == "exit"

  until operation =~ /^[\+\-*\/]$/
    puts "не верная операция"
    operation = STDIN.gets.chomp
  end

  case operation
    when '+' then puts "Результат: #{first_integer + second_integer}"
    when '-' then puts "Результат: #{first_integer - second_integer}"
    when '*' then puts "Результат: #{first_integer * second_integer}"
    when '/' then puts "Результат: #{first_integer / second_integer}"
  end

end

puts "Вы вышли из программы."