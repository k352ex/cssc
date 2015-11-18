class IndexController < ApplicationController

	def index
		@post = Post.all.last(5)
		@freeboard = Freeboard.all.last(5)
	end

end
