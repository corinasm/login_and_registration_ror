class UsersController < ApplicationController
	def index
	end

	def new
	end

	def create
		user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location], state: params[:state], password: params[:password], password_confirmation: params[:password_confirmation])
	
		if user.errors.any?
			flash[:errors] = user.errors.full_messages
			redirect_to request.referrer
			
		else
			session[:user_id] = user.id
			@current_user = user
			redirect_to "/events"
		end	
	end	

	def show
		@current_user = User.find(session[:user_id])
	end	

end
