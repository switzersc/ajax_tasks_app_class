class ColorsController < ApplicationController
	def index
		@colors = Color.all
	end

	def create
		@color = Color.new(color_params)
		if @color.save
			render @color 
		else
			render nothing: true
		end
	end

	private

	def color_params
		params.require(:color).permit!
	end
end