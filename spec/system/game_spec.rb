require "rails_helper"

RSpec.describe "game" do
  before do
    Game.create!(
      questions: [
        "What is the capital of France?",
        "What is the capital of Italy?",
        "What is the capital of Spain?"
      ]
    )
  end
  it "allows a player to sign in" do
    visit "/"
    expect(page).to have_text("Quiz Game")
    expect(page).to have_text("Enter your name to start the quiz")
    fill_in "Player name", with: "Fisola"
    click_on "Start player session"
  end

  it "allows a player to sign out" do
    visit "/"
    expect(page).to have_text("Quiz Game")
    expect(page).to have_text("Enter your name to start the quiz")
    fill_in "Player name", with: "Fisola"
    click_on "Start player session"
    expect(page).to have_text("You are playing as Fisola")
    expect(page).to have_text("You are welcome to quiz game")
    click_on "Sign out"

    # question = Game.select(:questions).first[:questions].sample[0]

    # expect(page).to have_text(question)
    # fill_in "your answer", with: "Paris"
    # click_on "check answer"
  end


end
