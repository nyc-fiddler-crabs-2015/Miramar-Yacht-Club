class AuthController < ApplicationController

	def login_ajax
		user_params = params[:user]

		user = User.find_by_username(user_params[:username])

		if user && user.authenticate(user_params[:password])
			session[:user_id] = user.id
			 render :json => {avatar: user.avatar, user_id: user.id, username: user.username}
		else
			render 401
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to '/'
	end

	def login
		
	end

	def login_post
		user_params = params[:user]
		user = User.find_by_username(user_params[:username])

		if user && user.authenticate(user_params[:password])
			session[:user_id] = user.id
			p "success"
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end

	def signup
		@error = params[:error]
		@error = @error.tr!('_', ' ') if @error
	end

	def create
		user_params = params[:user]
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/'
		else
			redirect_to "/signup?error=You_need_to_fill_out_all_the_fields"

		end

	end

end