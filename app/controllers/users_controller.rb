class UsersController < ApplicationController
	respond_to :json
	def index
		@users = User.all
		respond_to do |format|
			format.json ## renders index.json.bldr when you go to '/users.json'
			format.js 
			format.html
		end
	end	

	def create
		@user = User.new(user_params)
		if @user.save
			render @user
		else
			render nothing: true
		end
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.json  # renders show.json.bldr when you go to "/users/1.json"
			format.html
		end
	end

	private

	def user_params
		params.require(:user).permit!
	end
end