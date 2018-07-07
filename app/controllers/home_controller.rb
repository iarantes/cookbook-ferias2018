class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def search
    @recipe = Recipe.where("title LIKE ?", "%#{params[:q]}%")

  end
end
