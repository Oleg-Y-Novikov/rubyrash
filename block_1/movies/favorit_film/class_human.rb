class Human
  attr_accessor :favorit_movie
  
  def initialize(name, patronymic, age)
    @name = name
    @patronymic = patronymic
    @age = age
    @favorit_movie = nil
  end

  def wats_you_name
    if old_man?
      puts "#{@name} #{@patronymic}"
      puts "и ему #{@age} - пожилой"
    else
      puts @name
      puts "и ему #{@age} - молодой"
    end
  end

  def old_man?
    if @age > 60
      return true
    else
      false
    end
  end

end
