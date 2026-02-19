# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# app/models/ingredient.rb
# db/seeds.rb

# First, create a default user (or find if it already exists)
# Create a demo user
# db/seeds.rb

# First, create a default user (or find if it already exists)
user = User.find_or_create_by!(email_address: "demo@example.com") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end

puts "Created demo user: #{user.email_address}"

# Create ingredients linked to this user
ingredients = [
  { name: "Coconut Oil", category: "Oil", description: "Great for hair moisture" },
  { name: "Shea Butter", category: "Butter", description: "Rich moisturizer for dry hair" },
  { name: "Aloe Vera Gel", category: "Gel", description: "Soothes scalp and adds shine" },
  { name: "Jojoba Oil", category: "Oil", description: "Mimics natural hair sebum" },
  { name: "Castor Oil", category: "Oil", description: "Promotes hair growth" },
  { name: "Argan Oil", category: "Oil", description: "Produced from the kernels of the argan tree,endemic to Morocco."},
  { name: "Rosemary Essential Oil", category: "Oil", description: "An oil extracted from the leaves of the Rosmarinus officinalis herb."}
]

ingredients.each do |ingredient_data|
  user.ingredients.find_or_create_by!(name: ingredient_data[:name]) do |i|
    i.category = ingredient_data[:category]
    i.description = ingredient_data[:description]
  end
end

puts "Created #{user.ingredients.count} ingredients for demo user!"