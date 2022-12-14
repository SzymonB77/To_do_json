# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :note, :is_done, :priority, :user_id, :execution_date,
             :image_url, :lists, :subtasks, :tag, :color

  def lists
    object.tasks_lists.map do |item|
      {
        id: item.list.id,
        title: item.list.title
      }
    end
  end

  def note
    object.note || 'none'
  end

  def priority
    object.priority || 'unknown'
  end

  def subtask
    object.subtask || 'none'
  end

  def tag
    object.tag || 'none'
  end
end
