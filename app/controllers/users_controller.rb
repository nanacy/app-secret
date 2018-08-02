class UsersController < ApplicationController
	def index
	end

	def create
		@user = User.new(pseudo: params["pseudo"], email: params["email"], password: params["password"])
		if @user.save
			puts "-"*10, "CREATION", "-"*10
			log_in(@user)
			redirect_to user_path(@user.id)
		else
			puts "-"*10, "NON CREER", "-"*10
			redirect_to users_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		user_param = params.require(:user).permit(:pseudo, :email)
		@user.update(user_param)
		redirect_to user_path(@user.id)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to '/'
	end

end
