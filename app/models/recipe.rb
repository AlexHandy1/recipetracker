class Recipe < ActiveRecord::Base
  has_many :ingredients

  #Method to map and display as text individual ingredient objects within each recipe
  def display_individual_ingredients
     ingredients = self.ingredients.map{|ingredient| ingredient.name}
     ingredients.uniq
  end

  #Method to count number of ingredient objects within each Recipe and then display quantity of each ingredient as text
  def quantity_of_ingredients
     counts = {}
     ingredients = self.ingredients.map{|ingredient| ingredient.name}
     ingredients.each{ |ingredient| counts[ingredient] = (counts[ingredient] ||0)+1 }
     ingredient_quantity = counts.map{|k, v|"#{v} * #{k}"}
     ingredient_quantity
  end
end
