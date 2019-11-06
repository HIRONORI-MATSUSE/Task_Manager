class TasksController < ApplicationController
  before_action :set_tasks, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    #reverse_orderとする事で降順で並ぶ。
    # @tasks = Task.all.reverse_order

    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(5)
    # @tasks = task_name_search(params)
    # @tasks = task_status(params)


    if params[:task].present?
      #もしparamsがtaskとpriorityだった場合
      if params[:task][:priority]
        @tasks = current_user.tasks.where.priority(params[:task][:priority]).page(params[:page]).per(5)
      end
      #もしparamsがtaskとsearchだった場合
      if params[:task][:search]
         @tasks = current_user.tasks.task_name_search(params[:task][:search]).page(params[:page]).per(5)
      end
      #もしparamsがtaskとsearchかつ、#もしparamsがtaskとtask_statusだった場合
      if params[:task][:search] && params[:task][:task_status]
        @tasks = current_user.tasks.task_status(params[:task][:task_status]).task_name_search(params[:task][:search]).page(params[:page]).per(5)
          # @tasks = Task.task_name_search(params[:task][:search]).where.task_status(params[:task][:task_status])
      end
    end
  #もしparamsがend_periodだった場合
    if params[:end_period]
      @tasks = current_user.tasks.order(end_period: :desc).page(params[:page]).per(5)
    end
    #もしparamsがpriorityだった場合
    if params[:priority]
      @tasks = current_user.tasks.order(priority: :desc).page(params[:page]).per(5)
    # else
      # @tasks = Task.all.order(created_at: :desc).page(params[:page])
    end
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
    params.require(:task).permit(:task_name, :task_details, :end_period,:task_status, :priority)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
