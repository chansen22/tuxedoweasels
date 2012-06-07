class CreateComicPosts < ActiveRecord::Migration
  def change
    create_table :comic_posts do |t|
      t.string :comic

      t.timestamps
    end
  end
end
