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

  def tasks_params
    params.require(:task).permit(:name, :status, :start_task, :employee_id)
  end

end
