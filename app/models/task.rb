# frozen_string_literal: true

class Task < ApplicationRecord
  COLOR_TYPES = %w[blue red purple green grey orange yellow pink brown white].freeze

  # validations
  validate :execution_date_is_after_current_date, on: %i[create]
  validates :name, presence: true
  validates :execution_date, presence: true
  validates :priority, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3
  }
  validates :color, inclusion: {
    in: :color_types,
    allow_blank: true
  }
  # associations
  belongs_to :user
  has_one_attached :image
  has_many :subtasks, dependent: :destroy
  has_many :tasks_lists, dependent: :destroy
  has_many :lists, through: :tasks_lists

  # filters
  scope :done, ->(*) { where(is_done: true) }
  scope :by_priority, ->(priority) { where(priority: priority) }
  scope :by_tags, ->(tag) { where(tag: tag) }
  scope :by_color, ->(color) { where(color: color) }
  scope :by_execution_date, ->(*) { order(execution_date: :asc) }

  private

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

  def execution_date_is_after_current_date
    return unless execution_date < Date.current

    errors.add(:execution_date, 'cannot be before current date')
  end

  def color_types
    COLOR_TYPES
  end
end
