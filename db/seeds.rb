# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "json"

recipe_title = [
  "Mushroom Risotto",
  "Spinach Artichoke Dip",
  "Sweet Potato Gnocchi",
  "Mac & Cheese",
  "Best Bolognese Sauce Ever",
  "Bake Chicken Caprese"
  "Enchalada Lost in the Sauce",
  "Avocado Mousse",
  "Butternut Squash & Arugula Galette",
  "Herb Crusted Rack of Lamb",
  "Spiced Sweet Potato Spirals with Guac",
  "Caitlin's Famous Foccacia"
]

mushroom_risotto_ingredients = [
  {name: "olive oil", quantity: "4", unit: "tbsp"},
  {name: "white mushrooms", quantity: "2", unit: "680 grams"},
  {name: "arborio rice", quantity: "1.5", unit: "cups"},
  {name: "shallots", quantity: "2"},
  {name: "dry white wine", quantity: "1/2", unit: "cup"},
  {name: "chicken broth", quantity: "5", unit: "cups"},
  {name: "parmesan", quantity: "1/3", unit: "cup"},
  {name: "chives", quantity: "4", unit: "tbsp"},
  {name: "butter", quantity: "4", unit: "tbsp"}
  {name: "ground pepper", unit: "to taste"}
]

spinach_artichoke_ingredients = [
  {name: "regular cream cheese", quantity: "1 package", unit: "227 grams"},
  {name: "sour cream", quantity: "2/3", unit: "cup"},
  {name: "mayonnaise", quantity: "1/3", unit: "cup"},
  {name: "garlic", quantity: "4", unit: "cloves"},
  {name: "jar of artichokes", quantity: "1", unit: "420 grams"},
  {name: "chicken broth", quantity: "5", unit: "cups"},
  {name: "parmesan", quantity: "1/3", unit: "cup"},
  {name: "chives", quantity: "4", unit: "tbsp"},
  {name: "butter", quantity: "4", unit: "tbsp"}
  {name: "ground pepper", unit: "to taste"}
]
