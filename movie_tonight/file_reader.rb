class FileReader
  
  def initialize(genre)
    @route_films = File.dirname(__FILE__) + "/data/#{genre}.txt"
  end

  def generate_films
    if File.exist?(@route_films)
      file = File.new(@route_films, "r")
      films = file.readlines
      file.close
      number = rand(films.size + 1)
      number -= 1 unless number.even?
      puts films[number]
      puts films[number + 1]
    else
      puts "Фаил не найден"
    end
  end
end
