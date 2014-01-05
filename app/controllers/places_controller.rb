class PlacesController < ApplicationController
  
  layout "application"

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
    #@place.temp_card_text = params[temp_card_text]
    #@card = Card.new
    if Place.where(:name => @place.name, :city => @place.city, :country => @place.country).blank?
      if @place.save
        flash[:notice] = "'#{@place.name}' created successfully."

      else
        # If save, fails, redisplay the form so the user can fix problems
        render('new')
      end
    else
      flash[:notice] = "Adding pin to existing place"
      @place = Place.find_by(name: @place.name, city: @place.city, country: @place.country)
    end
    @card.place_id = @place.id
    #@card.text = "temporary text until this shit starts working"
    @card.save

    #session[:my_key] = 'my value'

    #Then access it in another controller by simply calling session[:my_key]
    #:temp_card_text => params[:temp_card_text]
    #redirect_to(:controller => 'cards', :action => 'create', :place_id => :id, :text => @place.temp_card_text)
    redirect_to(:controller => 'cards', :action => 'index', :place_id => @place.id)
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
