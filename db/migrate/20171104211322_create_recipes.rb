class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :title
      t.integer :work_duration
      t.integer :cooking_duration
      t.string :difficulty
      t.text :instructions

      t.timestamps
    end
  end
end
