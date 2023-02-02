require "rails_helper"

RSpec.describe "game" do
  before do
    Question.create!(
      questions: [
        ["What is the capital city of France", ["Paris", "Copenhagen", "Helsinki", "Berlin"], ["Paris"]],
        ["What is the capital city of Spain", ["Madrid", "Sevilla", "Oslo", "Barcelona"], ["Madrid"]],
        ["What is the capital city of Italy", ["Rome", "Milan", "Lisbon", "Porto"], ["Rome"]],
        ["What is the capital city of Nigeria", ["Abuja", "Lagos", "Calabar", "Lokoja"], ["Abuja"]]
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
  end
  context "when generates one question" do
    it "allows a player to answer the question correctly" do
      visit "/"
      expect(page).to have_text("Quiz Game")
      expect(page).to have_text("Enter your name to start the quiz")
      fill_in "Player name", with: "Fisola"
      click_on "Start player session"
      expect(page).to have_text("You are playing as Fisola")
      expect(page).to have_text("You are welcome to quiz game")
      click_on "start quiz"

      game = JSON.parse(Game.last.question)
      question = game.first
      answer = game.last.join
      response = game[1].first

      choose(option: response)
      click_on "Check answer"

      expect(page).to have_text("You are correct!")
    end
  end

  context "when generates two questions" do
    it "allows a player to answer questions correctly and wrongly, respectively" do
      visit "/"
      expect(page).to have_text("Quiz Game")
      expect(page).to have_text("Enter your name to start the quiz")
      fill_in "Player name", with: "Fisola"
      click_on "Start player session"
      expect(page).to have_text("You are playing as Fisola")
      expect(page).to have_text("You are welcome to quiz game")
      click_on "start quiz"

      game = JSON.parse(Game.last.question)
      question = game.first
      answer = game.last.join
      response = game[1].first

      choose(option: response)
      click_on "Check answer"

      expect(page).to have_text("You are correct!")

      click_on "Generate question"

      game = JSON.parse(Game.last.question)
      question = game.first
      answer = game.last.join
      response = game[1].last

      choose(option: response)
      click_on "Check answer"

      expect(page).to have_text("You are wrong! The answer is #{answer.upcase}")
    end
  end
end
