all_tickets = [
  {ticket_number: 'РМ2010398 050298', route: 'Москва -> Сочи', passenger: 'Венедикт В. Ерофеев', pasport: '45 99 505281'},
  {ticket_number: 'РМ2010398 050299', route: 'Москва -> Сочи', passenger: 'Петров Петр Петрович', pasport: '11 98 505245'},
  {ticket_number: 'РМ2010398 050300', route: 'Москва -> Сочи', passenger: 'Иванов Иван Иванович', pasport: '34 00 502233'}
]
=begin
puts "Пассажиры поезда #{all_tickets[0][:route]}"
puts "* * * Место № 1 * * *"
all_tickets[0].each { |key, value| puts "#{key.to_s.capitalize}: #{value}" }
puts "* * * Место № 2 * * *"
all_tickets[1].each { |key, value| puts "#{key.to_s.capitalize}: #{value}" }
puts "* * * Место № 3 * * *"
all_tickets[2].each { |key, value| puts "#{key.to_s.capitalize}: #{value}" }
=end

=begin
def printer(array, proc)
  array.each(&proc)
end
pro = proc { |key, value| puts "#{key.to_s.capitalize}: #{value}" }
printer(all_tickets[0], pro)
=end

def printer(array)
  #mesto = 1
  #while mesto <= array.size
    #puts "* * * Место № #{mesto} * * *"
    if block_given?
      c = yield(array) 
      puts c
    #mesto += 1
    end
end

printer(all_tickets) do |array| array.each do |hash| puts "* * * Место № #{array.index(hash) + 1} * * *"
    hash.each { |key, value| puts "#{key.to_s.capitalize}: #{value}" }
  end
  rand(2)
end
