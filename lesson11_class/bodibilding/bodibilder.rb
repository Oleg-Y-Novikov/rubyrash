require_relative "class_bodibilder"

person1 = BodiBilder.new
person2 = BodiBilder.new

muscle = ["legs", "arms", "torso"]
count1 = rand(10)
count2 = rand(10)

count1.times { person1.trening(muscle.sample) }
count2.times { person2.trening(muscle.sample) }
=begin
person1.trening("legs")
person1.trening("arms")
person1.trening("torso")

person2.trening("legs")
person2.trening("arms")
=end
puts "Первый бодибилдер:"
person1.progress
sleep 1
puts "Второй бодибилдер:"
person2.progress