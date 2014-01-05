class CardsController < ApplicationController
  
  layout "application"

  before_action :confirm_logged_in
  before_action :find_place

  def index
    @cards = Card.newest_first
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    # This is handled by the 'place' controller via the 'new' and 'check_exist' actions
  end

  def create
    # This is handled by the 'place' controller via the 'new' and 'check_exist' actions
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
      params.require(:card).permit(:place_id, :text)
    end

    def find_place
      if params[:place_id]
        @place = Place.find(params[:place_id])
      end
    end

end
