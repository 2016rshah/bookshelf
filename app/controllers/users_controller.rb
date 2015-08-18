class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@books = @user.books.order("books.author")
	end
end
