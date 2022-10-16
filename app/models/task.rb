class Task < ApplicationRecord
    validates :name, presence: true
    
    validates :priority, numericality: {
        only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3
      }
    belongs_to :user
end
