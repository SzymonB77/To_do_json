require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    #it { is_expected.to validate_presence_of(:execution_date) }
    it { is_expected.to validate_numericality_of(:priority).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(3) }
  end
end
