variable = 5
# Напишем класс, который проверяет наличие переменной в одном из своих методов
class MyClass

  def initialize
    @variable = "Hello"
  end

  def check_variables
    puts "В классе:"
    var = 3
    puts "Переменная '@variable': #{defined?(@variable)}"
    puts "Переменная 'variable': #{defined?(variable)}"
    puts "Переменная 'var': #{defined?(var)}"
  end
end

obj = MyClass.new
obj.check_variables
# Наконец, убедимся, что переменные экземпляров недоступны вне методов класса
puts "======================"
puts "Вне класса:"
puts "Переменная '@variable': #{defined?(@variable)}"
puts "Переменная 'variable': #{defined?(variable)}"
puts "Переменная 'var': #{defined?(var)}"
