class TasksController < ApplicationController

  def index
    render json: Task.all
  end

  def show
    task = Task.find(params[:id])
    render json: task
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task
    else
      render json: task.errors
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: task.errors
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    render json: task
  end

  private

  def task_params
    params.require(:task).permit(:id, :title, :done)
  end
end
