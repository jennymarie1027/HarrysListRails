# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |post|
    Post.create!(
        author_id: "author #{post}",
        title: "test title #{post}",
        price: 100,
        category: "Furniture",
        description: "this is a test description ...",
        image: "https://images.unsplash.com/photo-1731412924028-204b15ca8f1d?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        file: "file",
        location: "Denver",
        is_fave: false
    )
end

