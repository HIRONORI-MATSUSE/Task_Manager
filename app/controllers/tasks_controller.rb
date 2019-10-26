class TasksController < ApplicationController
  before_action :set_tasks, only:[:show, :edit, :update, :destroy]

  def index
    #reverse_orderとする事で降順で並ぶ。
    # @tasks = Task.all.reverse_order
    if params[:end_period]
      @tasks = Task.all.order(end_period: :desc)
    elsif params[:priority]
      @tasks = Task.all.order(priority: :desc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    redirect_to tasks_path, notice: '作成しました'
    else
    render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: '削除しました'
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :task_details, :end_period,:task_status, :priority, :author)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
