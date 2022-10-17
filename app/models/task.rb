class Task < ApplicationRecord
    validates :name, presence: true
    validates :execution_date, presence: true 
    
    validates :priority, numericality: {
        only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3
      }
    belongs_to :user

    validate :execution_date_is_after_current_date, on: %i[create update]
    
  private
  #Testy zaczęły się wywalać po dodaniu tego
    def execution_date_is_after_current_date
      if execution_date < Date.current
        errors.add(:execution_date,'cannot be before current date')
      end
    end
  
end

