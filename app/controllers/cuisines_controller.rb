class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id]) 
    @recipes = @cuisine.recipes
  end

  def new
    @cuisine = Cuisine.new()
  end

  def create
    @cuisine = Cuisine.create(params.require(:cuisine).permit(:name))
    if @cuisine.valid?
      redirect_to cuisine_path(@cuisine)
    else
      @error = "Você deve informar o nome da cozinha"
      render 'new'
    end
  end 
end