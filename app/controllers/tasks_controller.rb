class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # 全件表示
    # @tasks = current_user.tasks.recent

    # ransackによる通常表示
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).recent

    # ransackを使った複数ワードによるAND検索の実装
    # https://qiita.com/EastResident/items/54047e6e85dda0418dad
    if params[:q].present?
      # keywords = params[:q][:name_cont].split(' ')
      keywords = params[:q][:name_cont].split(/[\p{blank}\s]+/)
      # # grouping_hash = { a: { name_cont: keyword[0] },
      # #                   b: { name_cont: keyword[1] } }
      grouping_hash = keywords.inject({}) do |hash, word|
        hash.merge(word => { name_cont: word })
      end
      # grouping_hash = {"太郎"=>{:name_cont=>"太郎"},
      #                  "次郎"=>{:name_cont=>"次郎"}}
      if params[:q][:created_at_gteq].present?
        grouping_hash = grouping_hash.merge("created_at_gteq"=>{:created_at_gteq=>params[:q][:created_at_gteq]})
      end
      @q = current_user.tasks.ransack({ combinator: 'and', groupings: grouping_hash })
      @tasks = @q.result(distinct: true).recent
    end
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
