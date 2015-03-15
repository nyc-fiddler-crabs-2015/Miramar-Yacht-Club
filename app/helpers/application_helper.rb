module ApplicationHelper
	def current_user
		@user = User.find(1)
	end
end
