class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
  end

	def create
  		@quiz = Quiz.find(params[:quiz_id])
  		@question = @quiz.questions.create(quizzes_params)
  		redirect_to category_path(@quiz)
  	end

  	def destroy
  		@quiz = Quiz.find(params[:quiz_id])
  		@question = @quiz.questions.find(params[:id])
  		@question.destroy
  		redirect_to category_path(@quiz)
  	end

private
  	def quizzes_params
  		params.require(:question).permit(:content)
  	end
end
