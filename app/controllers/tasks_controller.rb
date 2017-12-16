class TasksController < ApplicationController
  def index
    @task=Task.all
    respond_to do |format|
    format.html
    format.js
  end
  end

  def create
    Task.create(task_params)
    @task=Task.all
    respond_to do |format|
    format.html
    format.js
    end

  end

  def edit
   @task=Task.find(params[:id])
  end

  def update
    @task=Task.find(params[:id])
    @task.update_attributes(task_params)
    @task=Task.all
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js { }
    end
  end

  def destroy
    task=Task.find(params[:id])
    task.destroy
    @task=Task.all
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js { }

  end
  end

  private
   def task_params
     params.require(:task).permit(:title, :content)
   end
end
