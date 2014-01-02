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
      flash[:notice] = "'#{@place.name}' created successfully."
      redirect_to(:action => 'index')
    else
      # If save, fails, redisplay the form so the user can fix problems
      render('new')
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    # Find an existing object using form paramters
    @place = Place.find(params[:id])
    # Update the object
    if @place.update_attributes(place_params)
      flash[:notice] = "'#{@place.name}' updated successfully."
      redirect_to(:action => 'show', :id => @place.id)
    else
      # If update, fails, redisplay the form so the user can fix problems
      render('edit')
    end
  end

  def delete
    @place = Place.find(params[:id])
  end

  def destroy
    place = Place.find(params[:id]).destroy
    flash[:notice] = "'#{place.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def place_params
      # same as using "params[:place]", except that it:
      # - raises an error if :place is not present
      # - allows listed attributes to be mass-assigned
      params.require(:place).permit(:name, :zip_code, :location_type, :latitude, :longitude, :country_code)
    end


end
