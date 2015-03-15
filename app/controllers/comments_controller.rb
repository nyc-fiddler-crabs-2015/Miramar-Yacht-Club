class CommentsController < ApplicationController

	# def index
	# end

	# def new

	# end

	# def show
	# end
	def create
		@comment = Comment.create(user_id: 1, event_id: params[:event_id], content: params[:content])
		redirect_to :back
	end


end