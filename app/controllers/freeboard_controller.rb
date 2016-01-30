class FreeboardController < ApplicationController

    # 인증된 유저만 접근
    before_action :authenticate_user!

	def index
        @board = Board.all.order('created_at DESC').page(params[:page]).per(5)
	end

	def show
        @board = Board.find(params[:id])
        @freeboard_comment = FreeboardComment.new
        @freeboard_comments = FreeboardComment.all
        @user = User.all
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		@board.user_id = params[:user_id]
        @board.author = params[:author]

		if @board.save
			flash[:notice] = "글이 작성되었습니다."
			redirect_to board_path(@board)
		else
			flash[:alert] = '실패'
			render 'new'
		end
	end

	def edit
		@board = Board.find(params[:id])
	end

	def update
		@board = Board.find(params[:id])

 		if @board.update(board_params)
	 		redirect_to @board
 		else
	 		render 'edit'
 		end
	end

    def destroy
        @board = Board.find(params[:id])
        @board.destroy
        redirect_to board_index_path
    end

    private

	def board_params
		params.require(:board).permit(:title, :content, :author)
	end

end
