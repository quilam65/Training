class ChangeDescriptionProducts < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :products, :description, :string
    end

    def down
      change_column :products, :description, :text
    end
  end
end
