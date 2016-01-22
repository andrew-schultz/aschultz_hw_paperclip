class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			current_user = @user
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def index
		if current_user
			@user = current_user
			@users = User.all
		else
			redirect_to log_in_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		if @user.save
	  		flash[:notice] = "Account Updated"
	  		redirect_to root_path
	  	else
	  		flash[:notice] = "There was an error editing your account, please try again"
	  		redirect_to :back
	  	end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :bio, :avatar)
	end

end
