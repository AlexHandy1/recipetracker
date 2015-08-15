class Recipe < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
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

  #Separate search method for querying by recipe name attribute
  def self.search_name(search_term)
    where("name like ?", "%#{search_term}%")
  end

  #Separate search method for querying by recipe cooking time attribute
  def self.search_cooking_time(search_term)
    where("cooking_time like ?", "%#{search_term}%")
  end

  #Separate search method for querying by recipe ingredients - required join as searching an underlying object vs simple attribute
  def self.search_ingredients(search_term)
    joins(:ingredients).uniq.where(ingredients: {name: "#{search_term}"})
  end
end
