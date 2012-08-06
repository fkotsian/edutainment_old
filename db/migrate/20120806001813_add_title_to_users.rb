class AddTitleToUsers < ActiveRecord::Migration
  def change
	add_column :users, :title, :string, default: "The Adventures of The Boss"
  end
end
