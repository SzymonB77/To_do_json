# frozen_string_literal: true

class Subtask < ApplicationRecord
  validates :title, presence: true
  belongs_to :task
end
