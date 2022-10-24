# frozen_string_literal: true

# Task
class Task < ApplicationRecord

  COLOR_TYPES = %w[blue red purple green grey orange yellow pink brown].freeze

  validates :name, presence: true
  validates :execution_date, presence: true
  validates :priority, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3
  }
  validates :color, inclusion: {
    in: :color_types,
    allow_blank: true
  }

  belongs_to :user
  has_one_attached :image
  has_many :subtasks
  has_many :tasks_lists
  has_many :lists, through: :tasks_lists
  validate :execution_date_is_after_current_date, on: %i[create]

  private

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

   # Testy zaczely sie wywalac po dodaniu tego
  def execution_date_is_after_current_date
    return unless execution_date < Date.current

    errors.add(:execution_date, 'cannot be before current date')
  end
end
