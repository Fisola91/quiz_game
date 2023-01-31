class QuestionsController < ApplicationController
  def create
    if session[:current_player_id]
      player = Player.find(session[:current_player_id])
      game = Game.find(params[:game_id])
      answer = params[:answer]
      Question.create(
        game: game,
        answer: answer,
        player: player
      )
      redirect_to game_path(game)
    end
  end
end
