class Recipe < ActiveRecord::Base
  has_many :ingredients

  #Method to map and display as text individual ingredient objects within each recipe
  def display_individual_ingredients
     ingredients = self.ingredients.map{|ingredient| ingredient.name}
     ingredients.uniq
  end
end
