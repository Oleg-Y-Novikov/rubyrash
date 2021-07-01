module Utils  
  class FileReader 
    def initialize
      @file_answers = File.dirname(__FILE__) + "/data/answers.txt"
      @file_questions = File.dirname(__FILE__) + "/data/questions.txt"
    end

    attr_reader :file_answers, :file_questions

    def generate_answers
      if File.exist?(file_answers)
        file = File.new(file_answers, "r")
        answers = file.readlines
        file.close
        answers
      else
        puts "Фаил с ответами не найден"
      end
    end

    def generate_questions
      if File.exist?(file_questions)
        file = File.new(file_questions, "r")
        questions = file.readlines
        file.close
        questions
      else
        puts "Фаил с вопросами не найден"
      end
    end
  end
end