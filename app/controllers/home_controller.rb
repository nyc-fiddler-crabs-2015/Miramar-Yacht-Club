class HomeController < ApplicationController
	layout "home"
	def index

		
	end
	def _right_nav
		render layout: false
		
	end
	def _members_only
		render layout: false
		
	end
end