all_tickets = [
  {ticket_number: 'РМ2010398 050298', route: 'Москва -> Сочи', passenger: 'Венедикт В. Ерофеев', pasport: '45 99 505281'},
  {ticket_number: 'РМ2010398 050299', route: 'Москва -> Сочи', passenger: 'Петров Петр Петрович', pasport: '11 98 505245'},
  {ticket_number: 'РМ2010398 050300', route: 'Москва -> Сочи', passenger: 'Иванов Иван Иванович', pasport: '34 00 502233'}
]

puts "Пассажиры поезда #{all_tickets[0][:route]}"
puts

def printer(array)
  array.each_with_index do |item, index|
    puts "* * * Место № #{index + 1} * * *"
    item.each { |key, value| puts "#{key.to_s.capitalize}: #{value}" }
    puts
  end
end

printer(all_tickets)
