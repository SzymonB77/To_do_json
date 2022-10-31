# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  COLOR_TYPES = %w[blue red purple green grey orange yellow pink brown white].freeze

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

  belongs_to :user
  has_one_attached :image
  has_many :subtasks, dependent: :destroy
  has_many :tasks_lists, dependent: :destroy
  has_many :lists, through: :tasks_lists

  # filters

  # is_done?
  scope :done, ->(*) { where(is_done: true) }
  # by priority
  scope :by_priority, ->(priority) { where(priority: priority) }
  # by_tags
  scope :by_tags, ->(tag) { where(tag: tag) }
  # by_color
  scope :by_color, ->(color) { where(color: color) }

  # sort
  # by_name_alphabetically
  scope :by_execution_date, -> { order(execution_date: :desc) }
  # by_execution_date


  private

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

  # Testy zaczely sie wywalac po dodaniu tego
  def execution_date_is_after_current_date
    return unless execution_date < Date.current

    errors.add(:execution_date, 'cannot be before current date')
  end

  def color_types
    COLOR_TYPES
  end
end
