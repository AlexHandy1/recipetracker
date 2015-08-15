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
end