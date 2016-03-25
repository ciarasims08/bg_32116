class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :players
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
