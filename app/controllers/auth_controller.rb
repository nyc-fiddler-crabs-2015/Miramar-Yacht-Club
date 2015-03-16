class AuthController < ApplicationController

	def login_ajax
		content_type :json
		user = User.find_by_username(params[:username])
		if user && user.authenticate( params[:password] )
			session[:user_id] = user.id
			{avatar: user.avatar, user_id: user.id, username: user.username}.to_json
		else
			401
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to '/'
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