require "./app/controllers/games_controller"
require "./app/constant_variable"

class GameComponent < ViewComponent::Base
  attr_reader :game

  def initialize(game:)
    @game = game
  end

  def sample_questions
    JSON.parse(game.question)
  end

  def question
    # if game.attempts.count == 0 || game.attempts.count > 0
    #   sample_questions.first.first
    # end
    next_question
  end

  # def previous_questions
  #   previous_question =[] sample_questions.first
  #   previous_question << sample_questions.first
  #   previous_question
  # end

  def next_question
    if sample_questions.include?(previous_questions)
      sample_questions.delete(previous_questions)
    end
    sample_questions.first.first
  end

  def no_answer?
    game.attempts.none?
  end

  def response
    game.attempts.last.answer
  end

  def solution_options
    sample_questions.first[1]
  end

  def answer
    last_option = sample_questions.first.last
    return response if last_option.include?(response)
    last_option
  end

  def message
    if no_answer?
      nil
    elsif response != answer
      "You are wrong! The answer is #{answer.upcase}"
    else
      "You are correct!"
    end
  end
end
