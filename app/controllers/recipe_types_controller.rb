class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = @recipe_type.recipes
  end

  def new
    @recipe_type = RecipeType.new()
  end

  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))

    if @recipe_type.save
      flash[:notice] = 'Tipo de receita cadastrado com sucesso'
      redirect_to recipe_type_path(@recipe_type)
    else
      flash[:alert] = 'Não foi possível cadastrar o tipo de receita'
      render 'new'
    end

  end
end
