class SessionsController < ApplicationController
  def new
  end

  def create
    player = Player.find_or_create_by(name: params[:name])
    session[:current_player_id] = player.id
    redirect_to games_path
  end

  def destroy
    session[:current_player_id] = nil
    redirect_to root_path
  end
end
