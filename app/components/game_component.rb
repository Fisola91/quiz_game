# frozen_string_literal: true

class GameComponent < ViewComponent::Base
  def initialize(game:)
    @game = game
  end

end
