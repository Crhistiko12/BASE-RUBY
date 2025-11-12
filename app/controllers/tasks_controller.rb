class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
    # Filtros por estado y prioridad
    if params[:status].present? && Task.statuses.key?(params[:status])
      @tasks = @tasks.where(status: Task.statuses[params[:status]])
    end
    if params[:priority].present? && Task.priorities.key?(params[:priority])
      @tasks = @tasks.where(priority: Task.priorities[params[:priority]])
    end
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: '¡Tarea creada exitosamente!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '¡Tarea actualizada exitosamente!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: '¡Tarea eliminada exitosamente!' }
      format.turbo_stream
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :priority)
  end
end