class CardsController < ApplicationController
  
  layout :determine_layout

  before_action :confirm_logged_in
  before_action :find_place

  def index
    @cards = Card.newest_first
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
    @place = Place.new
  end

  def create
    @card = Card.new(card_params)
    @card.place_id = 1
    if @card.save
      @pin = Pin.new
      @pin.card_id = @card.id
      @pin.description = "Default description"
      @pin.save
      flash[:notice] = "Card created successfully."
      redirect_to(:action => "index")
    else
      render('new')
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    # Find an existing object using form paramters
    @card = Card.find(params[:id])
    # Update the object
    if @card.update_attributes(card_params)
      flash[:notice] = "Pin updated successfully."
      redirect_to(:action => 'show', :id => @card.id)
    else
      # If update, fails, redisplay the form so the user can fix problems
      render('edit')
    end
  end

  def delete
    @card = Card.find(params[:id])
  end

  def destroy
    card = Card.find(params[:id]).destroy
    flash[:notice] = "Pin destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

    def card_params
      params.require(:card).permit(:id, :pin_id, :place_id, :text, :card_image)
    end

    def find_place
      if params[:place_id]
        @place = Place.find(params[:place_id])
      end
    end

end
