class QuestionAnswerController < ApplicationController
  before_action :authenticate_user!

  def index
    @question_answer = QuestionAnswer.all.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    @question_answer = QuestionAnswer.find(params[:id])
    @user = User.all
  end

  def new
    @question_answer = QuestionAnswer.new
  end

  def create
    @question_answer = QuestionAnswer.new(question_answer_params)
    @question_answer.user_id = params[:user_id]
    @question_answer.author = params[:author]

    if @question_answer.save
      flash[:success] = "질문이 작성되었습니다."
      redirect_to question_answer_path(@question_answer)
    else
      flash[:alert] = '실패'
      render 'new'
   end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def question_answer_params
    params.require(:question_answer).permit(:contents, :user_id, :author, :title)
  end
end
