class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.integer :views
      t.integer :user_id

      t.timestamps
    end
  end
end
