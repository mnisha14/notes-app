class UsersController < ApplicationController

	skip_before_filter :ensure_user_logged_in, :only => [:new, :create]

	def new
		@user = User.new
		render "users/new"
	end


	def create
		@user_params = params[:user]
		@user = User.new(@user_params)
	    
	    respond_to do |format|
	      if @user.save
	            format.html { redirect_to root_path, notice: 'Successfully Signed Up!!' }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end

		#User.create!(
		#	first_name: @user[:first_name],
		#	last_name: @user[:last_name],
		#	email: @user[:email],
		#	password: @user[:password],
		#)
		#flash[:notice] = "Successfully Signed Up"
		#redirect_to root_path
	end

end