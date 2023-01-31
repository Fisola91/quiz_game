class GamesController < ApplicationController
  def index
    if session[:current_player_id]
      @player = Player.find(session[:current_player_id])
    end
    @question = Game.question
  end

  def start
  end
end
