class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new()
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.create(params.require(:recipe).permit(:title, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method))
    redirect_to recipe_path(@recipe)
  end  
end
