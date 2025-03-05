class CreateUserConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :user_configs do |t|
      t.string :username
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
