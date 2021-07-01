class WordReader
  #attr_reader :rout_secret_word
  
  def initialize
    @rout_secret_word = File.dirname(__FILE__) + "/data/words.txt"
  end

  def read_from_file
    if File.exist?(@rout_secret_word)
      file = File.new(@rout_secret_word, "r")
      secret_word = file.readlines
      file.close
      secret_word.sample.chomp
    else
      puts "Фаил с секретными словами не найден"
    end
  end
end