# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html

require 'open-uri'
require 'json'

Ingredient.destroy_all
ingredient_list = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
ingredient_list["drinks"].each do |name|
  Ingredient.create( name: name["strIngredient1"] )
end

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

