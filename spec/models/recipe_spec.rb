require 'rails_helper'

describe Recipe do

  it 'can be created' do
    expect { Recipe.create }.to change { Recipe.count }.by 1
  end

  it { should have_many(:ingredients) }

  it {is_expected.to respond_to(:display_individual_ingredients)}

  it "can display its ingredients as text" do
    @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")
    expect(@recipe.display_individual_ingredients).to eq(["Chicken", "Lemon", "Thyme"])
  end

  it "can display the quantity of ingredients required as text" do
    @recipe = Recipe.create(name: "Lemon Chicken", cooking_time: "30 minutes")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Chicken")
    @recipe.ingredients.create(name: "Lemon")
    @recipe.ingredients.create(name: "Thyme")
    expect(@recipe.quantity_of_ingredients).to eq(["4 * Chicken", "1 * Lemon", "1 * Thyme"])
  end

  it "can search and return recipes matching a certain name" do
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
    search_output = Recipe.search_name("Chicken")
    expect(search_output.map{|recipe| recipe.name}).to eq(["Lemon Chicken", "Chicken Caesar Salad"])
  end

  it "can search and return recipes matching a certain cooking time" do
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
    search_output = Recipe.search_cooking_time("25 minutes")
    expect(search_output.map{|recipe| recipe.name}).to eq(["Chicken Caesar Salad"])
  end

  it "can search and return recipes matching a certain ingredient" do
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
    search_output = Recipe.search_ingredients("Lettuce")
    expect(search_output.map{|recipe| recipe.name}).to eq(["Chicken Caesar Salad"])
  end
end
