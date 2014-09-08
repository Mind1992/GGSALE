class UsersController < ApplicationController
	def index
		@users = User.all
	end

private
	
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :username)
	end

end