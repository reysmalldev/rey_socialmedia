class CreateUserPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :user_posts do |t|
      t.string :title
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
