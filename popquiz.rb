class Popquiz
    attr_reader :question, :answer1, :answer2, :answer3, :answer4, :correct
    def initialize(arg = {})
        @question = arg[:question]
        @answer1 = arg[:answer1]
        @answer2 = arg[:answer2]
        @answer3 = arg[:answer3]
        @answer4 = arg[:answer4]
        @correct = arg[:correct]
    end
end