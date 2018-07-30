class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredient = Ingredient.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
        if @cocktail.save
          redirect_to cocktail_path(@cocktail)
        else
          @cocktail = Cocktail.new(cocktail_params)
          render :new
        end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

    private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :ingredient)
  end

end
