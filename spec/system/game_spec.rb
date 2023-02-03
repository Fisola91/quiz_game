require "rails_helper"

RSpec.describe "game" do
  before do
    Question.create!(
      questions: [
        ["What is the capital city of France", ["Copenhagen", "Paris", "Helsinki", "Berlin"], "Paris"],
        ["What is the capital city of Spain", ["Madrid", "Sevilla", "Oslo", "Barcelona"], "Madrid"],
        ["What is the capital city of Italy", ["Rome", "Milan", "Lisbon", "Porto"], "Rome"],
        ["What is the capital city of Nigeria", ["Abuja", "Lagos", "Calabar", "Lokoja"], "Abuja"],
        ["Nigeria is situated in Western Africa and has a coastal border on which body of water?", ["Gulf of Mexico", "Gulf of Guinea", "Atlantic Ocean", "Caribbean Sea"], "Gulf of Guinea"],
        ["The national anthem of Nigeria has been 'Arise, O Compatriots' since 1978. What was the previous national anthem?", ["Arise Compatriots", "Obey The Call", "Nigeria The Great", "Nigeria We Hail Thee"], "Nigeria We Hail Thee"],
        ["What is the capital of Kwara State?", ["Akure", "Ilorin", "Ibadan", "Ekiti"], "Ilorin"],
        ["Who was the first senate president of the fourth republic?", ["Evan Enwerem", "Nnamdi Azikwe", "Obafemi Awolowo", "Tafawa Balewa"], "Evan Enwerem"],
        ["Nigeria is divided into 36 states. Which one is the largest by area?", ["Niger State", "Oyo State", "Anambra State", "Bauchi State"], "Niger State"],
        ["Nigeria adopted what currency in 1973? Nigeria still uses this currency.", ["US Dollars", "Pounds", "Euros", "Naira"], "Naira"],
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
      answer = game.last
      response = game[1].last

      choose(option: response)
      click_on "Check answer"

      expect(page).to have_text("You are wrong! The answer is #{answer.upcase}")
    end
  end
end
