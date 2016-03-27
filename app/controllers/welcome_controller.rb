class WelcomeController < ApplicationController
	def index
		@categories = Category.all
		@quizzes = Quiz.all
	end

	def show
	    render template: "welcome/#{params[:page]}"
	end
end
