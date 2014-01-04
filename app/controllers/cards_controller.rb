class CardsController < ApplicationController
  
  layout "application"

  before_action :confirm_logged_in

  def index
    @cards = Card.newest_first
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:notice] = "Card saved successfully"
      redirect_to(:action => 'index')
    else
      render('mew')
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
      params.require(:card).permit(:place_id, :text)
    end

end
