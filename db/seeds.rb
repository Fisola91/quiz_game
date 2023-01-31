# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.destroy_all

Game.create!(
  questions: [
    ["What is the capital of France?", "Paris"],
    ["What is the capital of Italy?", "Rome"],
    ["What is the capital of Spain?", "Madrid"]
  ]
)
