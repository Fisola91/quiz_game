class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :questions, array:true

      t.timestamps
    end
  end
end
