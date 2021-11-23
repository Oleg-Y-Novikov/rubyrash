require "uri"
require "net/http"
require "rexml/document"

uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

currency = {}

doc.each_element('//Valute') do |element|
  name = element.get_text('Name')
  value = element.get_text('Value')
  currency[name] = value
end

currency_sort = currency.select { |k, _v| k.to_s.start_with?("Доллар") || k.to_s.start_with?("Евро") }

currency_sort.merge!(currency)

currency_sort.to_a.each_with_index do |arr, index|
  puts "#{index + 1}. #{arr[0]} = #{arr[1]} руб."
end
