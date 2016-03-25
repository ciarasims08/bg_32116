class Category < ActiveRecord::Base
	has_many :quizzes, dependent: :destroy
end
