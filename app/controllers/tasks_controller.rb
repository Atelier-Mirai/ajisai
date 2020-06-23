class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # 全件表示
    # @tasks = current_user.tasks.recent

    # ransackによる検索
    # 名称欄でのAND検索 太郎 花子 ができる
    if params[:q][:name_cont_all]
      params[:q][:name_cont_all] = params[:q][:name_cont_all].split(' ')
    end
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    # if params[:back].present?
    #   render :new
    #   return
    # end
    #
    if @task.save
      redirect_to tasks_url, success: "タスク #{@task.name} を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_url, info: "タスク #{@task.name} を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    # redirect_to tasks_url, error: "タスク #{task.name} を削除しました。"
    redirect_to tasks_url, warning: "タスク #{@task.name} を削除しました。"
  end

  # def confirm_new
  #   @task = current_user.tasks.new(task_params)
  #   render :new unless @task.valid?
  # end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
