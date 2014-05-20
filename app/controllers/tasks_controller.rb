class TasksController < ApplicationController
	def index
		@tasks = Task.all
		respond_to do |format|
			format.json  # renders 'index.json.jbuilder' for '/tasks.json', and that file calls on the partial 'tasks/tasks'
			format.html 
		end
	end

	def create
		@tasks = Task.all
		@task = Task.new(task_params)
		if @task.save
			render :index
		else
			render nothing: true
		end
	end

	def update
		@task = Task.find(params[:id])
	 	if @task.update_attributes(task_params)
		 	respond_to do |format|
		 		format.js { render json: @task }
		 		
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
		params.require(:task).permit(:title, :completed, :due_date, :user_id)
	end
end
