class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :vid_url
      t.string :title
      t.integer :views
      t.integer :user_id

      t.timestamps
    end
  end
end
