class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:current_user_home]
	def show
		@user = User.find(params[:id])
		@books = @user.books.order("books.author")
	end
	def current_user_home 
		redirect_to current_user
	end
end
