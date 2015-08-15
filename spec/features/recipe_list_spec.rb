require 'rails_helper'

feature 'RecipeList' do
  scenario 'When there are no recipes in the system displays "Sorry, we currently have no recipes for you"' do
    visit '/'
    expect(page).to have_content('Sorry, we currently have no recipes for you')
  end

  scenario 'When one recipe exists in the system displays name, cooking time and ingredients' do
    @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")

    visit '/'
    expect(page).to have_content("Lemon Chicken")
    expect(page).to have_content("30 minutes")
    expect(page).to have_content("Chicken, Lemon, Thyme")
  end

  scenario 'When multiple recipes exist in the system displays all their details (name, cooking time and ingredients)' do
    @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")
    @recipe = Recipe.create(name: "Beef Stroganoff", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Beef")
    @recipe.ingredients.create(name: "Mustard")
    @recipe.ingredients.create(name: "Mushrooms")
    @recipe = Recipe.create(name: "Caesar Salad", cooking_time: "25 minutes")
    @recipe.ingredients.create(name: "Lettuce")
    @recipe.ingredients.create(name: "Croutons")
    @recipe.ingredients.create(name: "Parmesan")

    visit '/'
    expect(page).to have_content("Lemon Chicken")
    expect(page).to have_content("30 minutes")
    expect(page).to have_content("Chicken, Lemon, Thyme")
    expect(page).to have_content("Beef Stroganoff")
    expect(page).to have_content("30 minutes")
    expect(page).to have_content("Beef, Mustard, Mushrooms")
    expect(page).to have_content("Caesar Salad")
    expect(page).to have_content("25 minutes")
    expect(page).to have_content("Lettuce, Croutons, Parmesan")
  end

  scenario 'When click on recipe name then user is taken to the recipe page' do
    @recipe = Recipe.create(id: "1", name: "Lemon Chicken", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")

    visit '/'
    click_link 'Lemon Chicken'
    expect(current_path).to eq ('/recipes/1')
  end
end