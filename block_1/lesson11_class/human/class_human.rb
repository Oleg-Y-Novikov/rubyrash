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


#**********************************#

# Снова объявим уже знакомый нам класс Person
class Person
  # Во входных параметрах конструктора добавится один параметр — age (возраст)
  def initialize(first_name, middle_name, age)
    @first_name = first_name
    @middle_name = middle_name

    # Запишем его также в переменную экземпляра @age
    @age = age
  end

  # Объявим метод old? который будет возвращать true, если человеку больше
  # (или ровно) 60 и false, если меньше 60. Обратите внимание, что по соглашению
  # на конце такого метода должен быть вопросительный знак.
  def old?
    return @age >= 60
  end

  # В методе full_name нам теперь надо принять решение, как называть человека
  def full_name
    # Мы используем наш метод old? прямо в другом методе того же класса, чтобы
    # выяснить, является ли этот человек пожилым.
    if old?
      # Если является, выводим его полное имя
      return "#{@first_name} #{@middle_name}"
    else
      # Если нет, только имя, без отчества
      return @first_name
    end
  end

  # Нам также потребуется геттер для возраста
  def age
    return @age
  end
end