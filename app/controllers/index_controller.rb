class IndexController < ApplicationController

	def index
		@post = Post.all
	end	
end
