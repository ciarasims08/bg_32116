class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    @quiz.questions.build
  end
  def index
    @quizzes = Quiz.all
  end
  
  def show
    @category = Category.find(params[:category_id])
    @quiz = Quiz.find(params[:id])
  end

	def create
  		@category = Category.find(params[:category_id])
  		@quiz = @category.quizzes.create(quizzes_params)
  		redirect_to category_path(@category)
  	end

  	def destroy
  		@category = Category.find(params[:category_id])
  		@quiz = @category.quizzes.find(params[:id])
  		@quiz.destroy
  		redirect_to category_path(@category)
  	end

private
  	def quizzes_params
  		params.require(:quiz).permit(:name)
  	end
end
