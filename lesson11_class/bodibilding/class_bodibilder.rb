class BodiBilder
  
  def initialize #(legs, arms, torso)
    @legs = 0
    @arms = 0
    @torso = 0
  end

  def trening(muscle)
    case muscle
      when "legs" then @legs += 1
      when "arms" then @arms += 1
      when "torso" then @torso += 1
    else
      puts "ничего не прокачал"
    end
  end

  def progress
    puts "Ноги: #{@legs}"
    puts "Руки: #{@arms}"
    puts "Туловище: #{@torso}"
  end

end