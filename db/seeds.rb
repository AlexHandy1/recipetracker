# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes", :image => File.open('db/images/chicken.jpg', 'rb'))
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Lemon")
@recipe.ingredients.create(name: "Thyme")
@recipe = Recipe.create(name: "Beef Stroganoff", cooking_time: "30 minutes", :image => File.open('db/images/beef.jpg', 'rb'))
@recipe.ingredients.create(name: "Beef")
@recipe.ingredients.create(name: "Mustard")
@recipe.ingredients.create(name: "Mushrooms")
@recipe = Recipe.create(name: "Caesar Salad", cooking_time: "25 minutes", :image => File.open('db/images/caesar.jpg', 'rb'))
@recipe.ingredients.create(name: "Lettuce")
@recipe.ingredients.create(name: "Croutons")
@recipe.ingredients.create(name: "Parmesan")
