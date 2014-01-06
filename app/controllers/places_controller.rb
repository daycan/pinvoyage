class PlacesController < ApplicationController
  
  layout :determine_layout

  before_action :confirm_logged_in

  def index
    @places = Place.sorted
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @card = Card.new
    @place = Place.new
  end

  def check_exists
    @place = Place.new(place_params)
    @card = Card.new(card_params)
    @pin = Pin.new
    #@place.temp_card_text = params[temp_card_text]
    #@card = Card.new
    @place_exist = Place.where(:name => @place.name, :city => @place.city, :country => @place.country)
    if !@place_exist.blank?
      @place = @place_exist
    end

    if @place.save
      flash[:notice] = "'#{@place.name}' created successfully."
      @card.place_id = @place.id
      @card.save
      @pin.card_id = @card.id
      @pin.user_id = session[:user_id]
      @pin.save
      redirect_to(:controller => 'pins', :action => 'index')
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
      params.require(:place).permit(:name, :location_type, :city, :country)
    end

    def card_params
      params.require(:card).permit(:text)
    end


end
