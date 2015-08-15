class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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
