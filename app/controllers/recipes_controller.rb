class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new()
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def create
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = 'Receita cadastrada com sucesso'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Não foi possível cadastrar a receita'
      render 'new'
    end
  
  end  

  def edit
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def update
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    id = params[:id]
    @recipe = Recipe.find(id)
    
    if @recipe.update(recipe_params)
      flash[:notice] = 'Receita atualizada com sucesso'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Campos em branco'
      render 'edit'
    end

  end

  private 

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
  end

end
