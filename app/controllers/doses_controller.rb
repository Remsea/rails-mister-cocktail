class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(get_param)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    mydose = Dose.find(params[:id])
    mycocktail = mydose.cocktail
    mydose.delete
    redirect_to cocktail_path(mycocktail)
  end

  # def index
  #   @doses = Dose.all

  # end

  # def show
  #   @dose = Dose.find(params[:id])
  # end

  private

  def get_param
    {
      cocktail_id: params[:cocktail_id], # params[:dose][:cocktail_id]
      ingredient_id: params[:dose][:ingredient_id],
      description: params[:dose][:description]
    }
  end
end


