class CommentsController < ApplicationController

  def index

  end

  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.new(comment_params)
    @comments.user_id = params[:user_id]
    @comments.post_id = params[:post_id]
    
    if @comments.save
      redirect_to notice_path(@comments.post_id)
    else
      render 'new'
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
