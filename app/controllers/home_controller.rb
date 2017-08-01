class HomeController < ApplicationController

	def index
	
	end

	def show
		token = Setup.find_by_key("token").value
	end	
end
