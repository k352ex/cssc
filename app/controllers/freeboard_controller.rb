class FreeboardController < ApplicationController
  before_action :authenticate_user!

	def index
    @freeboard = Freeboard.all.order('created_at DESC').page(params[:page]).per(5)
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

  def destroy
    @freeboard = Freeboard.find(params[:id])
    @freeboard.destroy
    redirect_to freeboard_index_path
  end


	private

	def freeboard_params
		params.require(:freeboard).permit(:title, :content, :author)
	end
end
