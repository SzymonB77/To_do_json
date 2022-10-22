class AddTagToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :tag, :json
  end
end
