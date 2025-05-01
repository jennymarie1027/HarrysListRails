# db/seeds.rb
# Create categories
categories = [
  Category.create!(title: "Tools"),
  Category.create!(title: "Craft Supplies"),
  Category.create!(title: "Appliances"),
]

# Create locations
locations = [
  Location.create!(title: "Denver"),
  Location.create!(title: "Minneapolis"),
  Location.create!(title: "Chicago")
]

# Create a test user
user = User.create!(
  email: "test_2_v2@example.com",
  password_digest: "dummy_digest",
  session_token: "dummy_token"
)

# Create some items
items = [
  Item.create!(
    title: "Laptop",
    price: 999.99,
    category: categories[0],
    description: "Powerful laptop with 16GB RAM"
  ),
  Item.create!(
    title: "Sofa",
    price: 499.99,
    category: categories[1],
    description: "Comfortable 3-seater sofa"
  )
]

# Create posts
Post.create!(
  user: user,
  item: items[0],
  location: locations[0]
)

Post.create!(
  user: user,
  item: items[1],
  location: locations[1]
)