loop do
  puts "Целочисленный калькулятор. Для выхода введите \'exit\'"
  puts "Введите первое число:"
  first_integer = STDIN.gets.chomp
  break if first_integer == "exit"

  until first_integer = Integer(first_integer) rescue false
    puts "неверное значение, введите только целое число"
    first_integer = STDIN.gets.chomp
  end

  puts "Введите второе число:"
  second_integer = STDIN.gets.chomp
  break if second_integer == "exit"
  
  until second_integer = Integer(second_integer) rescue false
    puts "неверное значение, введите только целое число"
    second_integer = STDIN.gets.chomp
  end
  
  puts "Выберите операцию (+ - * /)"
  operation = STDIN.gets.chomp
  break if operation == "exit"

  until operation =~ /^[\+\-*\/]$/
    puts "не верная операция"
    operation = STDIN.gets.chomp
  end

  
  begin
    case operation
      when '+' then puts "Результат: #{first_integer + second_integer}"
      when '-' then puts "Результат: #{first_integer - second_integer}"
      when '*' then puts "Результат: #{first_integer * second_integer}"
      when '/' then puts "Результат: #{first_integer / second_integer}"
    end

  rescue ZeroDivisionError => error
    puts "На ноль делить нельзя! " + error.message
  end
end

puts "Вы вышли из программы."