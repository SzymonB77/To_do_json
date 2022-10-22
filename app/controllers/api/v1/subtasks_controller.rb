# frozen_string_literal: true

module Api
  module V1
    class SubtasksController < ApplicationController
      before_action :set_subtask, only: %i[update destroy]
      
      # POST /tasks/:id/subtasks
      def create
        @task = Task.find(params[:task_id])
        @subtask = @task.subtasks.build(subtask_params)

        if @subtask.save
          render json: @subtask, status: :created
        else
          render json: @subtask.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/:id/subtasks/:id
      
      def update
        if @subtask.update(subtask_params)
          render json: @subtask
        else
          render json: @subtask.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/:id/subtasks/:id
      def destroy
        if @subtask.destroy
          render json: @subtask
        else
          render json: { errors: @subtask.errors.messages }, status: :unprocessable_entity
        end
      end

      private

      def set_subtask
        @subtask = Subtask.find(params[:id])
      end

      def subtask_params
        params.require(:subtask).permit(:title)
      end
    end
  end
end
