class NoticeController < ApplicationController
  before_action :authenticate_user!

	def index
		# @post_new = Post.new
		@post = Post.all.order('created_at DESC').page(params[:page]).per(5)
	end

	def new
		@post = Post.new
	end

	def create
		  @post = Post.new(post_params)
			@post.user_id = params[:user_id]
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
    @comment = Comment.all
    @comments = Comment.new
    @user = User.all
	end

	def edit
		@post = Post.find(params[:id])
	end

 	def update
		@post = Post.find(params[:id])

 		if @post.update(post_params)
			flash[:notice] = "수정이 완료되었습니다."
	 		redirect_to notice_path(@post)
 		else
	 		render 'edit'
 		end
	end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to notice_index_path
  end

	private

	def post_params
		params.require(:post).permit(:title, :content, :author, :grade)
	end
end
