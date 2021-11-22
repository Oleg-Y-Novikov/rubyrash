# encoding: utf-8
#
# Программа «Прогноз погоды» Версия 1.2, с прогнозом погоды на неделю
#
# (с) rubyrush.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем нужные библиотеки
require 'net/http'
require 'rexml/document'

# Подключаем класс MeteoserviceForecast
require_relative 'lib/meteoservice_forecast'

CITIES = {
  37 => 'Москва',
  69 => 'Санкт-Петербург',
  99 => 'Новосибирск',
  59 => 'Пермь',
  115 => 'Орел',
  121 => 'Чита',
  141 => 'Братск',
  199 => 'Краснодар',
  54 => 'Новороссийск'
}.freeze

# Спрашиваем у пользователя, какой город ему нужен
puts 'Погоду для какого города Вы хотите узнать?'
CITIES.each { |k, v| puts "#{k} ==> #{v}" }

city_id = gets.chomp

# Сформировали адрес запроса
uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{city_id}.xml")

# URL = 'https://www.meteoservice.ru/export/gismeteo/point/37.xml'.freeze

response = Net::HTTP.get_response(uri)
doc = REXML::Document.new(response.body)

city_name = URI.decode_www_form_component(doc.root.elements['REPORT/TOWN'].attributes['sname'])

# Достаем все XML-теги <FORECAST> внутри тега <TOWN> и преобразуем их в массив
forecast_nodes = doc.root.elements['REPORT/TOWN'].elements.to_a

# Выводим название города и все прогнозы по порядку
puts city_name
puts

forecast_nodes.each do |node|
  puts MeteoserviceForecast.from_xml(node)
  puts
end
