class UsersController < ApplicationController
  def index
    @users = User.all
    @sale = @users.sales
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      'new'
    end
  end

  def show
    @user = current_user
    @sales = @user.sales
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :username)
    end
  end
