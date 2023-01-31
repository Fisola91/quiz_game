require "rails_helper"

RSpec.describe "question" do
  before do
    Game.create!(
      questions: [
        "What is the capital of France?",
        "What is the capital of Italy?",
        "What is the capital of Spain?"
      ]
    )
  end
  it "allows player to see question" do
    visit "/games"
    question = Game.last
  end
end
