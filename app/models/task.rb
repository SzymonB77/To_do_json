class Task < ApplicationRecord
    validates :name, presence: true
    
    validates_inclusion_of :priority, :in => 1..3
    belongs_to :user
end
