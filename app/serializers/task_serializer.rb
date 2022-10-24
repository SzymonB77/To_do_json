# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  #:image

  attributes :id, :name, :note, :is_done, :priority, :user_id, :execution_date, :image_url, :lists, :subtasks

  def lists
    self.object.tasks_lists.map do |item|
      {
        id: item.list.id,
        title: item.list.title
      }
    end
  end
end
