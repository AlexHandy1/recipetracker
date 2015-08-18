require 'rails_helper'

feature 'RecipeFilter' do
  before(:each) do
    @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")
    @recipe = Recipe.create(name: "Beef Stroganoff", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Beef")
    @recipe.ingredients.create(name: "Mustard")
    @recipe.ingredients.create(name: "Mushrooms")
    @recipe = Recipe.create(name: "Chicken Caesar Salad", cooking_time: "25 minutes")
    @recipe.ingredients.create(name: "Lettuce")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Parmesan")
  end

  scenario "When a search returns no matching results the message 'Sorry, nothing matched your filter term' is displayed" do
    visit ('/')
    within(".name_form") do
      fill_in 'search_name', with: 'Lasagne'
      page.find('#search').click
    end
    expect(page).to have_content('Sorry, nothing matched your filter term')
  end

  scenario "When search recipes by names with 'Chicken' then returns the 2 matching results" do
    visit ('/')
    within(".name_form") do
      fill_in 'search_name', with: 'Chicken'
      page.find('#search').click
    end
    expect(page).to have_content('Lemon Chicken')
    expect(page).to have_content('Chicken Caesar Salad')
  end

  scenario "When search recipes by cooking times with '25 minutes' then returns the 1 matching result" do
    visit ('/')
    within(".time_form") do
      fill_in 'search_cooking_time', with: '25 minutes'
      page.find('#search').click
    end
    expect(page).to have_content('Chicken Caesar Salad')
    expect(page).not_to have_content('Lemon Chicken')
    expect(page).not_to have_content('Beef Stroganoff')
  end

  scenario "When search recipes by ingredients with 'Lettuce' then returns the 1 matching result" do
    visit ('/')
    within(".ingredients_form") do
      fill_in'search_ingredients', with: 'Lettuce'
      page.find('#search').click
    end
    expect(page).to have_content('Chicken Caesar Salad')
    expect(page).not_to have_content('Lemon Chicken')
    expect(page).not_to have_content('Beef Stroganoff')
  end
end