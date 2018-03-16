class RemoveDescriptionToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :description, :text
  end
end
