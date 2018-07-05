class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = @recipe_type.recipes
  end
end
