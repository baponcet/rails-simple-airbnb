class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save

    redirect_to flats_path
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  def search
    @query = params[:search]
    @flats = Flat.where("flats.name LIKE '%#{@query}%'")
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :number_of_guests, :price_per_night, :image)
  end
end
