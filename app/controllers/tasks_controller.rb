class TasksController < ApplicationController
	def index
		@tasks = Task.incomplete
		# => render :index
	end

	def update
		@task = Task.find(params[:id])
	 	if @task.update_attributes(task_params)
		 	respond_to do |format|
		 		format.js
		 		# render :update => currently update.js.erb
		 		format.html { redirect_to tasks_path }
		 	end
		else
			respond_to do |format|
		 		format.js { render plain: "0" } # does not need file if you're doing it this way
		 		format.html { redirect_to tasks_path, notice: "Update failed." }
		 	end
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :completed)
	end
end
