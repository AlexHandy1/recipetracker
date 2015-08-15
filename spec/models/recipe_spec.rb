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
end
