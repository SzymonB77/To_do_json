# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  validates :name, presence: true
  validates :execution_date, presence: true

  validates :priority, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3
  }
  belongs_to :user
  has_one_attached :image
  # pomyslec co z update
  validate :execution_date_is_after_current_date, on: %i[create]

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

  private

  # Żeby dodawać załączniki należy podpiąć chmurę, wszystko tutaj działa tylko trzeba ją dodać

  # Testy zaczely sie wywalac po dodaniu tego
  def execution_date_is_after_current_date
    return unless execution_date < Date.current

    errors.add(:execution_date, 'cannot be before current date')
  end
end
