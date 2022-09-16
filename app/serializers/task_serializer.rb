class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :note, :is_done
end
