class CollaboratorsController < ApplicationController

	# def index
	# end

	def new
		@event_id = params[:event_id]
	end

	# def show
	# end

	def edit
		@event_id = params[:event_id]
		@collaborator = Collaborator.find(params[:id])
	
	end

	def destroy
		@event = Collaborator.destroy(params[:id])
		redirect_to :back 
	end

	def update
		@collaborator = Collaborator.update(params[:id], :guest_num => params[:guest_num])
		redirect_to "/events/#{params[:event_id]}"
	end

	def create
		@collaborator = Collaborator.create(user_id: 1, event_id: params[:event_id], guest_num: params[:guest_num])
		redirect_to "/events/#{params[:event_id]}"
	end
end