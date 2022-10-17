FactoryBot.define do
    factory :task do
      user
      name { Faker::Hobby.activity}
      note { 'note' }
      priority { 1 }
      execution_date { Date.current }
    end
  end