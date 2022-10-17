class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :note, :is_done, :priority, :user_id, :execution_date
end
