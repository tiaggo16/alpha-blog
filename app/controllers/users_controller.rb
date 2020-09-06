class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to aarticles_path
      flash[:notice] = "Welcome to the Alpha Blog, you have sucessfully signup"
    else
      render 'new'
    end     
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end