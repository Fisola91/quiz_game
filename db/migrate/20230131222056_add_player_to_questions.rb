class AddPlayerToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :player, null: false, foreign_key: true
  end
end
