class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.create(user_id: current_user.id, title: params[:title], description: params[:description], event_date: DateTime.parse('2015-03-11 13:30:00'))
	redirect "/events/#{@event.id}"
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:event_id])
	erb :'events/edit'
		
	end
	def update
		@event = Event.update(params[:event_id],)
	redirect "/events/#{params[event_id]}"
	end

	def create
		
	end

	


end
