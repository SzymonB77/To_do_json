class AddDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :execution_date, :date
  end
end
