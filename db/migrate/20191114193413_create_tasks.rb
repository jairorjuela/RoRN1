class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status, :default => "pending"
      t.datetime :start_task
      t.string :stimate_days

      t.timestamps
    end
  end
end
