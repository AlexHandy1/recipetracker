class RecipesController < ApplicationController

  #For filtering recipes by name, cooking time and ingredients, embedded 3 separate forms that provided parameters for tailored search methods to be called on the Recipe model to return the relevant query results from the database.
  def index
     if params[:search_name]
      @recipes = Recipe.search_name(params[:search_name]).paginate(:per_page => 10, :page => params[:page])
      @recipes == [] ? @search_message = 'Sorry, nothing matched your filter term' : @search_message = nil
    elsif params[:search_cooking_time]
      @recipes = Recipe.search_cooking_time(params[:search_cooking_time]).paginate(:per_page => 10, :page => params[:page])
      @recipes == [] ? @search_message = 'Sorry, nothing matched your filter term' : @search_message = nil
    elsif params[:search_ingredients]
      @recipes = Recipe.search_ingredients(params[:search_ingredients]).paginate(:per_page => 10, :page => params[:page])
      @recipes == [] ? @search_message = 'Sorry, nothing matched your filter term' : @search_message = nil
    else
      @recipes = Recipe.all.paginate(:per_page => 10, :page => params[:page])
    end
  end

  #Set-up error rescuing structure to present message if recipe doesn't exist
  def show
    begin
    @recipe = Recipe.find(params[:id])
    rescue
    @message = "Sorry, this recipe doesn't exist or may have been removed"
    end
  end
end
