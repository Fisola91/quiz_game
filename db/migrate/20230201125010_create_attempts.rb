class CreateAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :attempts do |t|
      t.string :answer
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
