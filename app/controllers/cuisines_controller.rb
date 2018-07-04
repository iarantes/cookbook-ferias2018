class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id]) 
    @recipes = @cuisine.recipes
  end

  def new
    @cuisine = Cuisine.new()
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))
    
    if @cuisine.save
      flash[:notice] = 'Cozinha cadastrada com sucesso'
      redirect_to cuisine_path(@cuisine)
    else
      flash[:alert] = 'Não foi possível cadastrar a cozinha'
      render 'new'
    end

  end 
end