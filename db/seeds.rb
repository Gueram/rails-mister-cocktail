# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

puts "Cleaning database..."
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Creating ingredients..."
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "Creating cocktails..."
cocktail = Cocktail.create(name: "Mojito" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Espresso martini" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Pimm’s" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Passion fruit martini" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Pina colada" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Rum punch" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Cosmopolitan" )
puts "Created #{cocktail.name}"
cocktail = Cocktail.create(name: "Aperol spritz" )
puts "Created #{cocktail.name}"

puts "Finished!"
