require 'csv'
require_relative 'popquiz'
require_relative 'view'

class QuizRepository
    attr_reader :base

    def initialize(csv_file)
      @questions = []
      @csv_options = { headers: :first_row, header_converters: :symbol }
      @csv_file = csv_file
      load_csv if File.exist?(csv_file)
      @base = 0
    end

    def all
      @questions
    end
    
    def add_score
      base += 1
    end

    private 

    def build_headers
      ["id", "question", "answer1", "answer2", "answer3", "answer4", "correct"]
    end

    #def build_row(popquiz)
    #  [{question: question, answer1: answer1, answer2: answer2, answer3: answer3, answer4 :answer4, correct: correct}
    #end

    def build_instance(row)
      Popquiz.new(row)
    end

    def load_csv
      CSV.foreach(@csv_file, @csv_options) do |row|
        @questions << build_instance(row)
      end
    end
end
