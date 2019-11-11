class TasksController < ApplicationController
  before_action :set_tasks, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    #デフォルト
    @tasks = current_user.tasks.includes(:labels).recent
     
    if params[:task].present?
      @tasks = @tasks.task_name_search(params[:task][:name_search]).task_status(params[:task][:task_status]).label_name_search(params[:task][:label_search])
    end 

    if params[:created_at]
      @tasks = @tasks.reorder(created_at: :desc) 
    elsif params[:end_period]
      @tasks = @tasks.reorder(end_period: :desc)
    elsif params[:priority]
      @tasks = @tasks.reorder(priority: :desc)
    end
    @tasks = @tasks.page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
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
    params.require(:task).permit(:task_name, :task_details, :end_period, :task_status, :priority, {label_ids:[]})
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
