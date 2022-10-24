# frozen_string_literal: true

class List < ApplicationRecord
  validates :title, presence: true

  has_many :tasks_lists
  has_many :task, through: :tasks_lists
end
