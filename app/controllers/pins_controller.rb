class PinsController < ApplicationController
  
  layout :determine_layout

  before_action :confirm_logged_in

  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.where(:user_id => session[:user_id])
  end

  def browse
    @pins = Pin.all
  end


  # GET /pins/1
  # GET /pins/1.json
  def show
  end


  # GET /pins/1/edit
  def edit
    @pin = Pin.find(params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pin }
      else
        format.html { render action: 'new' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    # Find an existing object using form paramters
    @pin = Pin.find(params[:id])
    # Update the object
    if @pin.update_attributes(pin_params)
      flash[:notice] = "Pin updated successfully."
      redirect_to(:action => 'index')
    else
      # If update, fails, redisplay the form so the user can fix problems
      render('edit')
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:id, :user_id, :card_id, :description, :position)
    end
end
