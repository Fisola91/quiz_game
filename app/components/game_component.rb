require "./app/controllers/games_controller"
class GameComponent < ViewComponent::Base
  attr_reader :game

  def initialize(game:)
    @game = game
  end

  def question
    JSON.parse(game.question).first
  end

  def no_answer?
    game.attempts.none?
  end

  def response
    game.attempts.last.answer
  end

  def solution_options
    JSON.parse(game.question)[1]
  end

  def answer
    JSON.parse(game.question).last.join
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
