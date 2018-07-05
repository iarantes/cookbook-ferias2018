class RecipeTypeController < ApplicationController
  def new
    @recipe_type = RecipeType.new()
  end
end