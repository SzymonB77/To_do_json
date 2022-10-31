# frozen_string_literal: true

class CreateTasksLists < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks_lists do |t|
      t.references :task, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tasks_lists, %i[task_id list_id], unique: true
  end
end
