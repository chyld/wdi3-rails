class TasksController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @tasks = @auth.tasks.joins(:priority).order('tasks.is_complete ASC').order('priorities.value DESC').order('tasks.title ASC')
  end
  def show
    task = Task.find(params[:id])
    render :json => task.as_json(:include => :priority)
  end
  def create
    task = Task.create(params[:task])
    @auth.tasks << task
    render :json => task.as_json(:include => :priority)
  end
  def update
    task = Task.find(params[:id])
    task.update_attributes(params[:task])
    render :json => task.as_json(:include => :priority)
  end
  def destroy
    task = Task.find(params[:id])
    task.delete
    render :json => task
  end
  def complete
    task = Task.find(params[:id])
    task.is_complete = !task.is_complete
    task.save
    render :json => task.as_json(:include => :priority)
  end
end
