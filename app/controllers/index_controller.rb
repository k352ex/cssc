class IndexController < ApplicationController

	def index
		@post = Post.all.last(5)
		@board = Board.all.last(5)
	end

end
