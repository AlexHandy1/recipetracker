require 'rails_helper'

feature 'RecipeProfile' do
  scenario 'When a recipe is visited that cannot be found then the message "Sorry, this recipe doesn\'t exist or may have been removed" is displayed' do
    visit '/recipes/1'
    expect(page).to have_content("Sorry, this recipe doesn't exist or may have been removed")
  end

  scenario "A recipe's name, cooking time and ingredients are listed on the profile" do
    @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes", image_file_name:'spec/fixtures/files/lemon_chicken.png')
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")

    visit '/'
    click_link 'Lemon Chicken'
    expect(page).to have_content("Lemon Chicken")
    expect(page).to have_content("30 minutes")
    expect(page).to have_content("4 * Chicken 1 * Lemon 1 * Thyme")
  end

  scenario "Displays an image for the recipe" do
   @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes", image_file_name:'spec/fixtures/files/lemon_chicken.png')
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")
    visit '/'
    click_link 'Lemon Chicken'
    expect(page).to have_xpath("//img[contains(@src, 'spec/fixtures/files/lemon_chicken.png')]")
  end
end