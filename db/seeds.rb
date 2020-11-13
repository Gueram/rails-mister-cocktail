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

file = URI.open('https://chefjamika.com/wp-content/uploads/mikas-mojito-1024x683.jpg')
cocktail = Cocktail.create(name: 'Mojito')
cocktail.photo.attach(io: file, filename: 'mojito.png', content_type: 'image/jpg')
puts "Created #{cocktail.name}"

file = URI.open('https://www.simplejoy.com/wp-content/uploads/2018/05/pina_colada.jpg')
cocktail = Cocktail.create(name: 'Pinna colada')
cocktail.photo.attach(io: file, filename: 'pinna_colada.png', content_type: 'image/jpg')
puts "Created #{cocktail.name}"

file = URI.open('https://cookingwithcurls.com/wp-content/uploads/2017/12/Caribbean-Rum-Punch-is-the-cure-for-shoveling-snow-and-braving-the-freezing-cold-temperatures-%C2%A9-2017-COOKING-WITH-CURLS.jpg')
cocktail = Cocktail.create(name: 'Rum punch')
cocktail.photo.attach(io: file, filename: 'rum_punch.png', content_type: 'image/jpg')
puts "Created #{cocktail.name}"

file = URI.open('https://mixthatdrink.com/wp-content/uploads/2009/05/cosmopolitan-cocktail.jpg')
cocktail = Cocktail.create(name: 'Cosmopolitan')
cocktail.photo.attach(io: file, filename: 'cosmopolitan.png', content_type: 'image/jpg')
puts "Created #{cocktail.name}"

file = URI.open('https://kitchenswagger.com/wp-content/uploads/2019/10/aperol-spritz-dark2.jpg')
cocktail = Cocktail.create(name: 'Aperol spritz')
cocktail.photo.attach(io: file, filename: 'aperol_spritz.png', content_type: 'image/jpg')
puts "Created #{cocktail.name}"

file = URI.open('https://i1.wp.com/www.alicepegie.com/fr/wp-content/uploads/2013/05/cocktail-conga-8-750x965.jpg?resize=618%2C795')
cocktail = Cocktail.create(name: 'Cocktail sans alcool')
cocktail.photo.attach(io: file, filename: 'cocktail_ss_alcool.png', content_type: 'image/jpg')
puts "Created #{cocktail.name}"

puts "Finished!"
