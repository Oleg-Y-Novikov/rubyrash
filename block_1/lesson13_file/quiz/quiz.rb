require_relative "utils/file_reader.rb"

class Quiz

  def self.start_quiz
    new.start_quiz
  end
  
  def initialize
    @file_reader = Utils::FileReader.new
  end

  attr_reader :file_reader
  

  def start_quiz
    questions = file_reader.generate_questions
    answers = file_reader.generate_answers

    puts "Мини-викторина. Ответьте на вопросы."

    errors = 0
    correct_answer = 0
    count_answers = 0

    for question in questions
      puts question
      user_input = gets
        if user_input == answers[count_answers]
          correct_answer += 1
          count_answers += 1
          puts "Верный ответ!"
        else
          errors += 1
          puts "Неправильно. Правильный ответ: #{answers[count_answers]}"
          count_answers += 1
        end
    end

    puts "У вас #{correct_answer} правильных ответов из #{answers.size}, ошибок: #{errors}"
  end   
end

Quiz.start_quiz