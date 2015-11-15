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

		if @freeboard.save
			flash[:notice] = "글이 작성되었습니다."
			redirect_to freeboard_path(@freeboard)
		else
			flash[:alert] = '실패'
			render 'new'
		end
	end

	private

	def freeboard_params
		params.require(:freeboard).permit(:title, :content, :author)
	end
end
