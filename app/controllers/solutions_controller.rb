class SolutionsController < ApplicationController

	def solution
		render json: SocialUpdatesRetriver.get_updates #As controller should be as thin as possible, moved logic in lib (check social_updates_retriver.rb)
	end
end