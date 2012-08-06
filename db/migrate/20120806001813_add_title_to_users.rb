class AddTitleToUsers < ActiveRecord::Migration
  def change
	add_column :users, :title, :string, default: "The Adventures of Dr. Boss"
  end
end
