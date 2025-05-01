class RestructureDatabase < ActiveRecord::Migration[8.0]
  def change
    # Drop existing tables that we'll replace
    drop_table :posts

    # Create new tables according to the ERD
    create_table "categories", force: :cascade do |t|
      t.string "title", null: false
      t.timestamps
    end

    create_table "locations", force: :cascade do |t|
      t.string "title", null: false
      t.timestamps
    end

    create_table "items", force: :cascade do |t|
      t.string "title"
      t.decimal "price", precision: 10, scale: 2
      t.references "category", foreign_key: true
      t.text "description"
      t.string "image"
      t.timestamps
    end

    # Create the posts table as a join table
    create_table "posts", force: :cascade do |t|
      t.references "user", foreign_key: true, null: false
      t.references "item", foreign_key: true, null: false
      t.references "location", foreign_key: true
      t.timestamps
    end
  end
end