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
	      flash[:notice] = "공지가 작성되었습니다."
	      redirect_to notice_path(@post)
	    else
	      flash[:alert] = '실패'
	      render 'new'
	   end
	 end

	def show
		@post = Post.find(params[:id])
	end

 	def update

	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :author)
	end
end
