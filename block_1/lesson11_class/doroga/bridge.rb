class Bridge
  
  def initialize
    puts "мост создан!"
    @opened = false
  end

  def open
    @opened = true
    puts "мост открыт, можно ехать!"
  end

  def is_opened?
    @opened
  end

end