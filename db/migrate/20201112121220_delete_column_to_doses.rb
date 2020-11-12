class DeleteColumnToDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :coktail_id
    add_reference :doses, :cocktail, foreign_key: true
  end
end
