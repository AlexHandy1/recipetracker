# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#creating recipes for database
@recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes", :image => File.open('db/images/chicken.jpg', 'rb'))
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Lemon")
@recipe.ingredients.create(name: "Thyme")

@recipe = Recipe.create(name: "Beef Stroganoff", cooking_time: "30 minutes", :image => File.open('db/images/beef.jpg', 'rb'))
@recipe.ingredients.create(name: "Beef")
@recipe.ingredients.create(name: "Mustard")
@recipe.ingredients.create(name: "Mushrooms")

@recipe = Recipe.create(name: "Chicken Caesar Salad", cooking_time: "25 minutes", :image => File.open('db/images/caesar.jpg', 'rb'))
@recipe.ingredients.create(name: "Lettuce")
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Parmesan")

@recipe = Recipe.create(name: "Chicken Curry", cooking_time: "40 minutes", :image => File.open('db/images/chicken_curry.jpg', 'rb'))
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Rice")
@recipe.ingredients.create(name: "Curry Sauce")

@recipe = Recipe.create(name: "Scrambled Eggs", cooking_time: "15 minutes", :image => File.open('db/images/scrambled_egg.jpg', 'rb'))
@recipe.ingredients.create(name: "Eggs")
@recipe.ingredients.create(name: "Eggs")
@recipe.ingredients.create(name: "Eggs")
@recipe.ingredients.create(name: "Cream")
@recipe.ingredients.create(name: "Butter")

@recipe = Recipe.create(name: "Beef Wellington", cooking_time: "50 minutes", :image => File.open('db/images/beef_wellington.jpg', 'rb'))
@recipe.ingredients.create(name: "Beef")
@recipe.ingredients.create(name: "Mushrooms")
@recipe.ingredients.create(name: "Puff Pastry")

@recipe = Recipe.create(name: "Ratatouille", cooking_time: "30 minutes", :image => File.open('db/images/ratatouille.jpg', 'rb'))
@recipe.ingredients.create(name: "Red Peppers")
@recipe.ingredients.create(name: "Red Peppers")
@recipe.ingredients.create(name: "Courgettes")
@recipe.ingredients.create(name: "Courgettes")
@recipe.ingredients.create(name: "Aubergines")
@recipe.ingredients.create(name: "Aubergines")

@recipe = Recipe.create(name: "Macaroni Cheese", cooking_time: "20 minutes", :image => File.open('db/images/macaroni.jpg', 'rb'))
@recipe.ingredients.create(name: "Cheese")
@recipe.ingredients.create(name: "Pasta")

@recipe = Recipe.create(name: "Fish Cakes", cooking_time: "35 minutes", :image => File.open('db/images/fish_cakes.jpg', 'rb'))
@recipe.ingredients.create(name: "Salmon")
@recipe.ingredients.create(name: "Salmon")
@recipe.ingredients.create(name: "Breadcrumbs")
@recipe.ingredients.create(name: "Spring Onions")
@recipe.ingredients.create(name: "Eggs")
@recipe.ingredients.create(name: "Flour")

@recipe = Recipe.create(name: "Potato Wedges", cooking_time: "15 minutes", :image => File.open('db/images/wedges.jpg', 'rb'))
@recipe.ingredients.create(name: "Potatoes")
@recipe.ingredients.create(name: "Potatoes")
@recipe.ingredients.create(name: "Potatoes")
@recipe.ingredients.create(name: "Oil")

@recipe = Recipe.create(name: "Chicken Kiev", cooking_time: "40 minutes", :image => File.open('db/images/chicken_kiev.jpg', 'rb'))
@recipe.ingredients.create(name: "Chicken")
@recipe.ingredients.create(name: "Garlic")

@recipe = Recipe.create(name: "Fish and Chips", cooking_time: "35 minutes", :image => File.open('db/images/fish_and_chips.jpg', 'rb'))
@recipe.ingredients.create(name: "Cod")
@recipe.ingredients.create(name: "Cod")
@recipe.ingredients.create(name: "Potatoes")
@recipe.ingredients.create(name: "Potatoes")

@recipe = Recipe.create(name: "Roast Lamb", cooking_time: "90 minutes", :image => File.open('db/images/roast_lamb.jpg', 'rb'))
@recipe.ingredients.create(name: "Lamb")
@recipe.ingredients.create(name: "Potatoes")
@recipe.ingredients.create(name: "Potatoes")

@recipe = Recipe.create(name: "Pepperoni Pizza", cooking_time: "30 minutes", :image => File.open('db/images/pizza.jpg', 'rb'))
@recipe.ingredients.create(name: "Bread")
@recipe.ingredients.create(name: "Tomato")
@recipe.ingredients.create(name: "Pepperoni")
@recipe.ingredients.create(name: "Cheese")

@recipe = Recipe.create(name: "Mushroom Stroganoff", cooking_time: "25 minutes", :image => File.open('db/images/mushroom_stroganoff.jpg', 'rb'))
@recipe.ingredients.create(name: "Mushrooms")
@recipe.ingredients.create(name: "Mustard")
@recipe.ingredients.create(name: "Rice")
