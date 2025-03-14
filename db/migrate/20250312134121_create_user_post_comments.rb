class CreateUserPostComments < ActiveRecord::Migration[8.0]
  def change
    create_table :user_post_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_post, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
