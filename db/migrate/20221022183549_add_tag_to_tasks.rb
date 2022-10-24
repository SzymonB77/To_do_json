class AddTagToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :tag, :jsonb
    add_index :tasks, :tag, using: :gin
  end
end
