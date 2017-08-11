class DosesController < ApplicationController

# GET /doses
def index
  @doses = Dose.all
end

  # GET /doses/1
  def show
    @dose = Dose.find(params[:id])
  end

  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredient = Ingredient.all
    # ingredient_list

  end

  def ingredient_list
    @ingredient_list = []
    Ingredient.all.each { |ingredient| @ingredient_list << ingredient[:name]}
    @ingredient_list
  end


  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail


    if @dose.save
      redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
