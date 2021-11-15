require 'rexml/document'

current_path = File.dirname(__FILE__)
file_path = "#{current_path}/business_card.xml"

abort "визитка по пути #{file_path} не найдена" unless File.exist?(file_path)

file = File.new(file_path)

doc = REXML::Document.new(file)

file.close

card = {}
%w[first_name second_name last_name phone_number email_address skills].each do |el|
  card[el] = doc.root.elements[el].text
end
p card
puts "#{card['first_name']} #{card['second_name']} #{card['last_name']}"
puts "#{card['phone_number']}, #{card['email_address']}"
puts card['skills']
