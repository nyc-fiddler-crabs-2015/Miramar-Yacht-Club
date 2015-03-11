post '/events/:event_id/comments' do
	@comment = Comment.create(user_id: current_user.id, event_id: params[:event_id], content: params[:content])
	redirect back
end