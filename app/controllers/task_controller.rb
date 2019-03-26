class TaskController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_param)
    if @task.save
      flash.notice = "タスク「#{@task.name}」を登録しました。"
      redirect_to task_index_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_param)
    flash.notice = "タスク「#{task.name}」を更新しました。"
    redirect_to task_index_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash.notice = "タスク「#{task.name}」を削除しました。"
    redirect_to task_index_path
  end

  private

  def task_param
    params.require(:task).permit(:name, :description)
  end
end
