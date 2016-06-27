class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :author
      t.boolean :is_pinned
      t.boolean :is_draft
      t.integer :comments_count

      t.timestamps null: false
    end

   add_foreign_key :posts, :users, column: :author_id
  end
end
