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
    @cuisines = Cuisine.all
    @recipe = Recipe.new(params.require(:recipe).permit(:title, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method))

    if @recipe.save
      flash[:notice] = 'Receita cadastrada com sucesso'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Não foi possível cadastrar a receita'
      render 'new'
    end
  
  end  
end
