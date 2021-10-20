class Printer

  def self.print_fase
    if File.exist?(SeveFaceInFile.path)
      file = File.open(SeveFaceInFile.path, "r")
      fase = file.read
      file.close
      puts fase
    else
      puts "Фаил по пути #{SeveFaceInFile.path} не найден"
    end
  end
end