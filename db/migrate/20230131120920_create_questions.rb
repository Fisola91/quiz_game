class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :questions, array:true

      t.timestamps
    end
  end
end
