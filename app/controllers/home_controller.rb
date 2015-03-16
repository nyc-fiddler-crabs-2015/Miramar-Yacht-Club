class HomeController < ApplicationController
	layout "home"
	def index
		puts "\n\n\n\n\n"
		p session
		
	end
end