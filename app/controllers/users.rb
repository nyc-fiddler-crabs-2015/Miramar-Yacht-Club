get '/users' do
	erb :'users/index'
end

get '/users.json' do
	content_type :json
	@users = User.all
	@users.to_json
end

get '/users/:id' do
	redirect '/' if !current_user
	@user = User.find(params[:id])
	@my_events = Event.where(user_id: current_user.id)
	@my_collabs = Collaborator.where(user_id: current_user.id)
	erb :'users/show'
end

get '/account_settings' do
	redirect '/login' if !current_user
	erb :'users/edit'
end

put '/user/:user_id' do
	if current_user.id = params[:user_id]
		User.update(params[:user_id], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :username => params[:username])
		redirect "/account_settings?status=Success"
	end
end

delete '/user/:user_id' do
	if current_user.id = params[:user_id]
		User.destroy(current_user.id)
		session.clear
		redirect "/"
	end
end