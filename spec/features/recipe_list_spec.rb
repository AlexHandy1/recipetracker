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

  #assume random ordering
  scenario 'When there are more than 10 recipes, only the the first 10 recipes are shown' do
    #set-up recipes to fill 1 page
    10.times do |x|
      @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
      @recipe.ingredients.create(name: "Chicken")
      @recipe.ingredients.create(name: "Lemon")
      @recipe.ingredients.create(name: "Thyme")
    end

     #create recipe that won't be showing on first page - would sit on second page
    @recipe = Recipe.create(name: "Beef Stroganoff", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Beef")
    @recipe.ingredients.create(name: "Mustard")
    @recipe.ingredients.create(name: "Mushrooms")

    visit '/'
    expect(page).not_to have_content("Beef Stroganoff")
  end

  scenario 'When there are more than 20 recipes and click on second page (following pagination navigation markers) user can see next 10 recipes' do
    #set-up recipes to fill 2 pages bar 1 target recipe
    19.times do |x|
      @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
      @recipe.ingredients.create(name: "Chicken")
      @recipe.ingredients.create(name: "Lemon")
      @recipe.ingredients.create(name: "Thyme")
    end

    #create target recipe on second page
    @recipe = Recipe.create(name: "Beef Stroganoff", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Beef")
    @recipe.ingredients.create(name: "Mustard")
    @recipe.ingredients.create(name: "Mushrooms")

    #create recipe that won't be showing on second page - would sit on third page
    @recipe = Recipe.create(name: "Caesar Salad", cooking_time: "25 minutes")
    @recipe.ingredients.create(name: "Lettuce")
    @recipe.ingredients.create(name: "Croutons")
    @recipe.ingredients.create(name: "Parmesan")
    visit '/'
    click_link '2'
    expect(page).to have_content("Beef Stroganoff")
    expect(page).not_to have_content("Caesar Salad")
    click_link '3'
    expect(page).to have_content("Caesar Salad")
  end
end