class GamesController < ApplicationController
  def show
    if session[:current_player_id]
      @player = Player.find(session[:current_player_id])
      @game = Game.find(params[:id])
      @question = Game.question.first
    end
    # binding.pry
    # unless @game.questions.last
    #   binding.pry
    #   if game.questions.last.answer == Game.question.second
    #     "correct"
    #   else
    #     "wrong"
    #   end
    # end
  end
end
