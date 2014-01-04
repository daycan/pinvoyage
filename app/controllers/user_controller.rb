class UserController < ApplicationController

  layout "application"
  
  before_action :confirm_logged_in, :except => [:new, :create,]

  def index
    @users = User.sorted
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully."
      redirect_to(:controller => "cards")
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Account updated successfully."
      redirect_to(:action => "show")
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "Account destroyed"
    redirect_to(:action => "new")
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end



end
