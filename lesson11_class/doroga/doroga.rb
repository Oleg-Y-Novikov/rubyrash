require_relative "bridge"

puts "Поехали!"

sleep 1

puts "Внезапно река!"

sleep 1

bridge = Bridge.new

sleep 1

unless bridge.is_opened?
  bridge.open
end 

sleep 1

puts "Поехали дальше!"

puts bridge.is_opened?