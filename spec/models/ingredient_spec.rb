require 'rails_helper'

describe Ingredient do
  it 'can be created' do
    expect { Ingredient.create }.to change { Ingredient.count }.by 1
  end
  it { should belong_to(:recipe) }
end
