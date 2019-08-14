class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:name].blank?
      @cocktails = Cocktail.all
    else
    @name = params[:name]
    @cocktails = Cocktail.all.select { |cocktail| cocktail[:name].downcase == @name.downcase }
    end
  end

  def show
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
