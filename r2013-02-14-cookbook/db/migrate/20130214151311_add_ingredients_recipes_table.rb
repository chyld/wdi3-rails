class AddIngredientsRecipesTable < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes, :id => false do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
end
