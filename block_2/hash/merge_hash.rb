passengers = [
  {
    ticket_number: 'РМ2010398 050298',
    first_name: 'Венедикт',
    second_name: 'Васильевич',
    last_name: 'Ерофеев',
    passport_number: '45 99 505281',
    departure_city: 'Москва',
    destination_city: 'Петушки'
  },
  {
    ticket_number: 'РМ2010399 050298',
    first_name: 'Иннокентий',
    second_name: 'Петрович',
    last_name: 'Шниперсон',
    passport_number: '46 01 192872',
    departure_city: 'Павловский Посад',
    destination_city: 'Орехово-Зуево'
  },
  {
    ticket_number: 'РМ2010399 050298',
    first_name: 'Иван',
    second_name: 'Васильевич',
    last_name: 'Бунша',
    passport_number: '47 33 912876',
    departure_city: 'Москва',
    destination_city: 'Владимир'
  }
]

pas = passengers[0].merge(passengers[1], passengers[2])
puts pas
