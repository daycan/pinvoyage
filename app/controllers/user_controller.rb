class UserController < ApplicationController

  layout :determine_layout
  
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
      redirect_to(:controller => "access", :action => "attempt_login", :email => @user.email, :password => @user.password)
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end


end
