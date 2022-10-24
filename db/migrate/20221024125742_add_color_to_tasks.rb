# frozen_string_literal: true

class AddColorToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :color, :string, default: 'white'
  end
end
