class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @quizzes = Quiz.all
    @categories = Category.all
  end

  def show
    # @category = Category.find(params[:category_id])
    # @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
  end

	def create
  		@quiz = Quiz.find(params[:quiz_id])
  		@question = @quiz.questions.create(questions_params)
  		redirect_to quiz_questions_path(@quiz)
  	end

  	def destroy
  		@quiz = Quiz.find(params[:quiz_id])
  		@question = @quiz.questions.find(params[:id])
  		@question.destroy
  		redirect_to quiz_questions_path(@quiz)
  	end

private
  	def questions_params
  		params.require(:question).permit(:content)
  	end
end
