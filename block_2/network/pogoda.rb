# Подключаем библиотеку для работы c адресами URI
require 'uri'

# Подключаем библиотеку для загрузки данных по http-протоколу
require 'net/http'

# Подключаем библиотеку для парсинга XML
require 'rexml/document'

CLOUDINESS = {
  -1 => 'туман',
  0 => 'ясно',
  1 => 'малооблачно',
  2 => 'облачно',
  3 => 'пасмурно'
}.freeze

uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/54.xml")

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

city_name = URI.decode_www_form_component(doc.root.elements['REPORT/TOWN'].attributes['sname'])

forecast = doc.root.elements['REPORT/TOWN/FORECAST']

min_temp = forecast.elements['TEMPERATURE'].attributes['min']
max_temp = forecast.elements['TEMPERATURE'].attributes['max']
max_wind = forecast.elements['WIND'].attributes['max']
clouds_index = forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i
clouds = CLOUDINESS[clouds_index]

puts city_name
puts "Температура: от #{min_temp} до #{max_temp}"
puts "Ветер до #{max_wind}"
puts clouds

