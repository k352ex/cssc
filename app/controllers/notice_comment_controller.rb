class NoticeCommentController < ApplicationController
  def index

  end

  def new
    @notice_comments = Comment.new
  end

  def create
    @notice_comment = Comment.new(notice_comment_params)
    @notice_comment.user_id = params[:user_id]
    @notice_comment.post_id = params[:post_id]

    if @notice_comment.save
      redirect_to notice_path(@notice_comment.post_id)
    else
      render 'new'
    end

  end

  def update

  end

  def edit
    @notice_comment = Comment.find(params[:id])
  end

  def destroy
    @notice_comment = Comment.find(params[:id])
    @notice = @notice_comment.post_id
    @notice_comment.destroy
    redirect_to notice_path(@notice)
  end

  private

  def notice_comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
