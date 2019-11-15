class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    employee = Employee.find_by(name: "sin asignar")
    @task = Task.create(tasks_params.merge(employee: employee))
    if @task.save
      redirect_to tasks_path
    else
      @errors = @task.errors.full_messages
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if params[:commit].eql?("Asignar")
      Task.assign_task(tasks_params.merge(id: params[:id]))
      redirect_to tasks_path
    else
      "nada"
    end
  end

  def progress
    Task.progress_task(params)
    redirect_to tasks_path
  end

  def done
    Task.find(params[:format]).update(status: "done")
    redirect_to tasks_path
  end

  def tasks_params
    params.require(:task).permit(:name, :status, :start_task, :employee_id, :stimate_days)
  end

end
