class AddDescriptionToUsers < ActiveRecord::Migration
  def change
	add_column :users, :description, :string, default: "The Boss is the main man of rap, the siren of soul, and the reckoning of R&B. With his patented flow, he unleashes melodies of mathematical mastery on his mesmerized students. He looks a lot like Russell Simmons."  
  end
end
