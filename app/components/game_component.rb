require "./app/controllers/games_controller"
class GameComponent < ViewComponent::Base
  attr_reader :game

  def initialize(game:)
    @game = game
  end

  def sample_question
    JSON.parse(game.question)
  end

  def question
    sample_question.first
  end

  def no_answer?
    game.attempts.none?
  end

  def response
    game.attempts.last.answer
  end

  def solution_options
    sample_question[1]
  end

  def answer
    last_option = sample_question.last
    return response if last_option.include?(response)
    last_option.join
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
