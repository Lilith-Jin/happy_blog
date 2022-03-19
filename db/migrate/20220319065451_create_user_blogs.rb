class CreateUserBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_blogs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
