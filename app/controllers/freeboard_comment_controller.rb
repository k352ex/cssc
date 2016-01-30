class FreeboardCommentController < ApplicationController
  def index

  end

  def new
    @freeboard_comment = FreeboardComment.new
  end

  def create
    @freeboard_comment = FreeboardComment.new(freeboard_comment_params)
    @freeboard_comment.user_id = params[:user_id]
    @freeboard_comment.board_id = params[:board_id]

    if @freeboard_comment.save
      redirect_to board_path(@freeboard_comment.board_id)
    else
      render 'new'
    end

  end

  private

  def freeboard_comment_params
    params.require(:freeboard_comment).permit(:content, :user_id, :board_id)
  end
end
