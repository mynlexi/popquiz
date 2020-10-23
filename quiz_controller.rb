require_relative 'popquiz_repo'
require_relative 'view'

class QuizController
  def initialize(repo)
    @repo = repo
    @view = View.new
    @base = 0
    @number = 0
  end

  def show
    @view.say(@base)
  end

  def add_score
    @base += 1
  end
  
  def show_next_question
    popquiz = find
    correct = popquiz.correct
    @number += 1
    if @number < 9
      @view.display_question(popquiz)
      answer = @view.get("whats your guess").downcase
      validation(correct, answer)
    else
      @view.say("Game Other, your score is #{@base}")
    end   
  end

  def find
    question = @repo.all[@number]
  end


  
  def validation(correct, answer)
    pot_answer = %w(a b c d)
    if answer == correct
      add_score
      show_next_question
    elsif pot_answer.include?(answer)
      @view.say("sorry wrong answer, the correct one would have been #{correct}")
      show_next_question
    else
      @view.say("sorry you are not qualified to answer this quizz (cant even type abcd ???)")
      show_next_question
    end
  end
end