class FreeboardController < ApplicationController

	def index
		@freeboard = Freeboard.all
	end

	def show
		@freeboard = Freeboard.find(params[:id])
	end

	def new
		@freeboard = Freeboard.new
	end

	def create
		@freeboard = Freeboard.new(freeboard_params)
		@freeboard.user_id = params[:user_id]

		if @freeboard.save
			flash[:notice] = "글이 작성되었습니다."
			redirect_to freeboard_path(@freeboard)
		else
			flash[:alert] = '실패'
			render 'new'
		end
	end

	def edit
		@freeboard = Freeboard.find(params[:id])
	end

	def update
		@freeboard = Freeboard.find(params[:id])

 		if @freeboard.update(freeboard_params)
	 		redirect_to @freeboard
 		else
	 		render 'edit'
 		end
	end


	private

	def freeboard_params
		params.require(:freeboard).permit(:title, :content, :author)
	end
end
