class UsersController < ApplicationController

	def index
		
	end

	def users2
		@users = User.all
		render json: @users
	end

	def show
		redirect '/' if !current_user
		@user = User.find(params[:id])
		@my_events = Event.where(user_id: current_user.id)
		@my_collabs = Collaborator.where(user_id: current_user.id)

	end

	def edit
		redirect '/login' if !current_user
	end

	def update
		if current_user.id = params[:id]
			User.update(params[:id], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :username => params[:username])
			redirect_to "/users/#{current_user.id}/edit?status=Success"
		end
	end

	def destroy
		if current_user.id = params[:user_id]
			User.destroy(current_user.id)
			session.clear
			redirect_to "/"
		end
	end

end