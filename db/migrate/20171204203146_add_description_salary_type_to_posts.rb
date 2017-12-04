class AddDescriptionSalaryTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :description, :text
    add_column :posts, :salary, :decimal
    add_column :posts, :type, :string
  end
end
