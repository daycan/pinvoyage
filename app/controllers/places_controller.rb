class PlacesController < ApplicationController
  
  layout 'application'

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
    @card = Card.new({:card_image => params[:cards_attributes].card_image})

    if @place.save 
      @card.place_id = @place.id
      @card.save 
      flash[:notice] = "'#{@place.name}' created successfully."
      redirect_to(:controller => 'cards', :action => 'index')
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
    @place.get_foursquare_lat_lng
    @place.save
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
      params.require(:place).permit(:name, :location_type, :city, :country, cards_attributes: [:id, :place_id, :card_image, :text])
    end

    def card_params
      params.require(:place).permit(cards_attributes: [:id, :card_image, :text])
    end


end
