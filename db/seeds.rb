# frozen_string_literal: true


user = User.create(email: 'example@email.com', password: 123456)

list = List.create(name: "Personal")
list = List.create(name: "Programming")
list = List.create(name: "Learn Ruby")

20.times do
  task = Task.create(name: Faker::Hobby.activity, note: 'Typical note', priority: 2, user_id: 1, execution_date: '2023-10-10', color: 'blue', list_id: Faker::Number.between(from: 1, to: 3) )
end

10.times do
  subtask = Subtask.create(task_id: Faker::Number.between(from: 1, to: 20, title: Faker::Hobby.activity )
end
