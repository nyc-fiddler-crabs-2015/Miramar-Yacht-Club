get '/events/:event_id/collaborators/new' do 
	@event_id = params[:event_id]
	erb :'collaborators/new'
end

post '/events/:event_id/collaborators' do 
	@collaborator = Collaborator.create(user_id: current_user.id, event_id: params[:event_id], guest_num: params[:guest_num])
	redirect "/events/#{params[:event_id]}"
end

get '/events/:event_id/collaborators/:collaborator_id/edit' do 
	@event_id = params[:event_id]
	@collaborator = Collaborator.find(params[:collaborator_id])
	erb :'collaborators/edit'
end

put '/events/:event_id/collaborators/:collaborator_id' do 
	@collaborator = Collaborator.update(params[:collaborator_id], :guest_num => params[:guest_num])
	redirect "/events/#{params[:event_id]}"
end

delete '/events/:event_id/collaborators/:collaborator_id' do 
	@collaborator = Collaborator.destroy(params[:collaborator_id])
	redirect "/events/#{params[:event_id]}"
end