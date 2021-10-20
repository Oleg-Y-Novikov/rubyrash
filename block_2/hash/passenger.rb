ticket = "RGD1"
hash = {}
loop do
  puts "Введите название маршрута, для выхода exit:"
  route = gets.chomp
  break if route == "exit"
  puts "Введите ФИО пассажира:"
  passenger = gets.chomp
  puts "Введите паспортные данные пассажира:"
  pasport = gets.chomp

  hash[ticket] = {
    route: route,
    passenger: passenger,
    pasport: pasport
  }

  ticket = ticket.succ
end
loop do
  puts "Всего продано билетов - #{hash.keys.size}"
  puts "Номера проданных билетов:"
  print hash.keys
  puts 
  puts "Введите номер билета для получения информации: exit для выхода"
  number = gets.chomp
  break if number == "exit"
  if hash.has_key?(number)
      puts "Ticket №: #{number}"
      hash[number].each do |key, value|
        puts "#{key.to_s.capitalize}: #{value}"
      end
  else
    puts "Нет такого билета"
  end
end
