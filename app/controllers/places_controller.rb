class PlacesController < ApplicationController
  
  layout false

  def index
    @places = Place.sorted
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    # Save the object
    if @place.save
      redirect_to(:action => 'index')
    else
      # If save, fails, redisplay the form so the user can fix problems
      render('new')
    end
  end


  def edit
  end

  def delete
  end

  private

    def place_params
      # same as using "params[:place]", except that it:
      # - raises an error if :place is not present
      # - allows listed attributes to be mass-assigned
      params.require(:place).permit(:name, :zip_code, :location_type, :latitude, :longitude, :country_code)
    end


end
