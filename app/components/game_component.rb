require "./app/controllers/games_controller"
class GameComponent < ViewComponent::Base
  attr_reader :game
  def initialize(game:)
    @game = game
    @score = 0
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

  def answer
    JSON.parse(game.question).second
  end

  def message
    if no_answer?
      nil
    elsif response != answer
      "wrong"
      @score
    else
      "correct"
      @score =+1
    end
  end
end
