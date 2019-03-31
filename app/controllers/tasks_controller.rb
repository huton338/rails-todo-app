class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = current_user.tasks.order(created_at: :desc)
  end

  def show
    # @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_param)
    if @task.save
      flash.notice = "タスク「#{@task.name}」を登録しました。"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # task = current_user.tasks.find(params[:id])
    task.update!(task_param)
    flash.notice = "タスク「#{task.name}」を更新しました。"
    redirect_to tasks_path
  end

  def destroy
    # task = current_user.tasks.find(params[:id])
    task.destroy
    flash.notice = "タスク「#{task.name}」を削除しました。"
    redirect_to tasks_path
  end

  private

  def task_param
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
