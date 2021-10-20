class Chameleon

  def initialize(name, color)
    @name = name
    @color = color
    puts "появился хамелеон #{@name}, цвет у него #{@color}!"
  end

  def color(color)
    @color = color
    puts "#{@name} изменил окрас, теперь он #{@color}!"
  end

end

