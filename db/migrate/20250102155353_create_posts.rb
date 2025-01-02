class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :author_id
      t.string :title
      t.decimal :price
      t.string :category
      t.text :description
      t.string :image
      t.string :file
      t.string :location
      t.boolean :is_fave

      t.timestamps
    end
  end
end
