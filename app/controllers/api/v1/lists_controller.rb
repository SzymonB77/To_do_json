# frozen_string_literal: true

module Api
  module V1
    # List_controller
    class ListsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_list, only: %i[show update destroy]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      # GET /lists
      def index
        @pagy, @lists = pagy(List.all)

        render json: @lists
      end

      # GET /lists/1
      def show
        render json: @list
      end

      # POST /lists
      def create
        @list = List.new(list_params)

        if @list.save
          render json: @list, status: :created
        else
          render json: @list.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /lists/1
      def update
        if @list.update(list_params)
          render json: @list
        else
          render json: @list.errors, status: :unprocessable_entity
        end
      end

      # DELETE /lists/1
      def destroy
        @list.destroy
      end

      private

      def set_list
        @list = List.find(params[:id])
      end

      def list_params
        params.require(:list).permit(:title)
      end
    end
  end
end
