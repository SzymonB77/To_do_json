# frozen_string_literal: true

class TasksList < ApplicationRecord
  belongs_to :task
  belongs_to :list

  validates :task, uniqueness: { scope: %i[list_id task_id]}
end
