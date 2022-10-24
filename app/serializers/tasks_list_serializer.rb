class TasksListSerializer < ActiveModel::Serializer
  attributes :id, :title

  def id
    object.list.id
  end

  def title
    object.list.title
  end
end
