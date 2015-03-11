get '/events' do
	@events = Event.all
	erb :'events/index'
end

get '/events/new' do
erb :'events/new'

end

get '/events/:event_id' do
	@event = Event.find(params[:event_id])
	erb :'events/show'
end




post '/event' do
	# new
	@event = Event.create(user_id: current_user.id, title: params[:title], description: params[:description], event_date: DateTime.parse('2015-03-11 13:30:00'))
	redirect "/events/#{@event.id}"
end

get '/events/:event_id/edit' do
	@event = Event.find(params[:event_id])
	erb :'events/edit'
end


put '/events/:event_id' do
	@event = Event.update(params[:event_id],)
	redirect "/events/#{params[event_id]}"
end


delete '/events/:event_id' do
	@event = Event.destroy(params[:event_id])
	redirect "/events"

end