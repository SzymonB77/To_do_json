# frozen_string_literal: true

module Api
  module V1
    # Task_controller
    class TasksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_task, only: %i[show update destroy add_list delete_list]
      before_action :set_list, only: %i[add_list delete_list]
      after_action { pagy_headers_merge(@pagy) if @pagy }
      with_options only: :index do
        has_scope :done, type: :boolean
        has_scope :by_priority
        has_scope :by_tags
        has_scope :by_color
        has_scope :by_execution_date
      end

      # GET /tasks
      def index
        @pagy, @tasks = pagy(apply_scopes(Task.all))

        render json: @tasks
      end

      # GET /tasks/1
      def show
        render json: @task
      end

      # POST /tasks
      def create
        @task = current_user.tasks.build(task_params)

        if @task.save
          render json: @task, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/1
      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/1
      def destroy
        @task.destroy
      end

      # sss
      def add_list
        tasks_lists = TasksList.new(
          task: @task,
          list: @list
        )
        if tasks_lists.save
          render json: tasks_lists
        else
          render json: { errors: tasks_lists.errors.messages }, status: :unprocessable_entity
        end
      end

      # aaa
      def delete_list
        tasks_lists = @task.tasks_lists.find_by!(list_id: @list.id)
        if tasks_lists.destroy
          render json: tasks_lists
        else
          render json: { errors: @list.errors.to_s }, status: :unprocessable_entity
        end
      end

      private

      def set_task
        @task = Task.find(params[:id])
        # dodac komunikat o skasowaniu
      end

      def set_list
        @list = List.find(params[:list_id])
      end

      def task_params
        params.require(:task).permit(:name, :note, :is_done, :priority, :execution_date, :image,
                                     :tag, :color)
      end

      def list_params
        params.require(:list).permit(:title)
      end
    end
  end
end
