class SessionsController < ApplicationController

	skip_before_filter :ensure_user_logged_in

	def new
		
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:current_user_id] = user.id
			redirect_to folders_url
		else
			flash[:notice] = "Incorrect Email or Password"
			redirect_to sessions_url
		end
	end


	def destroy
		session[:current_user_id] = nil
		@current_user = nil
		redirect_to root_path
	end
end