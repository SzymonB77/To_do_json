# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  #:image
  attributes :id, :name, :note, :is_done, :priority, :user_id, :execution_date, :image_url, :subtasks
end
