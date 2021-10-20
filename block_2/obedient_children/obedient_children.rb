class Parents

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def obedient?
    true
  end
end

class Child < Parents

  def obedient?
    false
  end
end

father = Parents.new("Иванов Иван Иванович")
son = Child.new("Коля")
daughter = Child.new("Маша")

puts "#{father.name} послушный: #{father.obedient?}"
puts "#{son.name} послушный: #{son.obedient?}"
puts "#{daughter.name} послушная: #{daughter.obedient?}"
