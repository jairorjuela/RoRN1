class Task < ApplicationRecord

  belongs_to :employee

  validates_presence_of :name

  def self.assign_task(params)
    employee = Employee.find_by(name: params[:employee_id])
    task = Task.find(params[:id])
    task.update(employee: employee, stimate_days: params[:stimate_days])
  end

  def self.progress_task(params)

    task = Task.find(params[:format])

    if task.employee.name.eql?("sin asignar")
      params
    elsif task.start_task.present?
      params
    elsif task.status.eql?("done")
      params
    else
      time = Time.now + task.stimate_days.to_i.day
      task.update(status: "progress", start_task: time)
    end

  end

end
