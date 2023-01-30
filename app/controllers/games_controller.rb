class GamesController < ApplicationController
  def index
    @question = Game.question
  end
end
