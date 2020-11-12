class ChangeCoktailToCocktail < ActiveRecord::Migration[6.0]
  def change
    rename_table :coktails, :cocktails
  end
end
