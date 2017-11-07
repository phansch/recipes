class CreateRecipesIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes_ingredients do |t|
      t.references :recipe, foreign_key: true, index: true
      t.references :ingredient, foreign_key: true, index: true

      t.timestamps
    end
  end
end
