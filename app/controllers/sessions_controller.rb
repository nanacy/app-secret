class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		redirect_to '/login/show'
  	else
  		flash.now[:success] = "Authentification Error"
  		render 'new'
  		# redirect_to '/login'
  	end
  end

  def show
  end

  def destroy
  	log_out
  end

  def secret_page
  end
end
