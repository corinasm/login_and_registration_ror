class SessionsController < ApplicationController
	def new
	end

	def create	     
		@current_user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
		if @current_user
			session[:user_id]= @current_user.id
			redirect_to "/events"
		else 
			flash[:errors_login]  = "Invalid email or password. Try again"  
			redirect_to "/"
		end    
	end

	def delete
		session[:user_id] = nil
		redirect_to '/'
	end
end
