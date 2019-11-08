class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(get_param)

    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  def index
    @cocktails = Cocktail.all

  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    moncocktail = Cocktail.find(params[:id])
    if moncocktail.doses.size == 0
      moncocktail.destroy
      redirect_to cocktails_path
    else
      flash[:notice] = "Cocktails has doses, cant delete"
     redirect_to cocktails_path
    end
  end

  private

  def get_param
    {
      name: params[:cocktail][:name]
    }
  end

end
