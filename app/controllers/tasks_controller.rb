class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, success: "タスク #{@task.name} を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, info: "タスク #{@task.name} を更新しました。"
  end

  def destroy
    @task.destroy
    # redirect_to tasks_url, error: "タスク #{task.name} を削除しました。"
    redirect_to tasks_url, warning: "タスク #{@task.name} を削除しました。"
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
