class GamesController < ApplicationController
  def show
    if session[:current_player_id]
      @player = Player.find(session[:current_player_id])
      @game = Game.find(params[:id])
      @question = Game.question.first
    end
  end
end
