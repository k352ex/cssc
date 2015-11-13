class NoticeController < ApplicationController
	def index
		@post_new = Post.new
		@post = Post.all

	end

	def new
		@post = Post.new
	end

	def create
	    @post = Post.new(post_params)

	    if @post.save
	      redirect_to root_path
	    else
	      flash[:alert] = '실패'
	      render 'new'
	   end
	 end

	def show
		@post = Post.all
	end

 	def update

  	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :author)
	end
end
