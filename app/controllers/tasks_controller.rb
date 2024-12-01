class TasksController < ApplicationController
    def index
      @tasks = Task.all
      @task = Task.new # For form
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = false
      if @task.save
        redirect_to tasks_path, notice: "Task created successfully."
      else
        render :index
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: true)
      redirect_to tasks_path, notice: "Task marked as complete."
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title)
    end
  end
  