class RecipesController < ApplicationController
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

  def show
    #set-up error rescuing structure to present message if recipe doesn't exist
    begin
    @recipe = Recipe.find(params[:id])
    rescue
    @message = "Sorry, this recipe doesn't exist or may have been removed"
    end
  end
end
