class GamesController < ApplicationController
  def index
    if session[:current_player_id]
      @player = Player.find(session[:current_player_id])
    end
  end

  def create
    if session[:current_player_id]
      player = Player.find(session[:current_player_id])
      question = Question.question
      game = Game.create!(question: question)
      redirect_to game_path(game)
    end
  end

  def show
    if session[:current_player_id]
      @player = Player.find(session[:current_player_id])
      game = Game.find(params[:id])
      @component = GameComponent.new(game: game)
      #compare the question asked before to the new question coming

    end
  end

  # def next_question
  #   if session[:current_player_id]
  #     @player = Player.find(session[:current_player_id])
  #     game = Game.find(params[:id])

  #     biding.pry
  #     @component = GameComponent.new(game: game)
  #   end
  # end
end
