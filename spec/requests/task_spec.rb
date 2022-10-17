# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let(:user) { FactoryBot.create :user }
  let(:login_params) do
    {
      email: user.email,
      password: user.password
    }
  end
  let(:login_user) do
    post user_session_path, params: login_params
  end
  let(:task) { FactoryBot.create :task }
  let(:auth_headers) { FactoryBot.create(:user).create_new_auth_token }

  describe 'GET /tasks' do
    it 'Property see all user tasks' do
      get '/api/v1/tasks'
      login_user
      expect(response).to have_http_status(:ok)
    end

    it 'Unproperty see all user tasks' do
      get '/api/v1/tasks'
      expect(response).to have_http_status(:unauthorized)
    end
  end
  describe 'GET /task' do
    it 'Property see first task' do
      get '/api/v1/tasks/1'
      login_user
      expect(response).to have_http_status(:ok)
    end

    it 'Unproperty see all user tasks' do
      get '/api/v1/tasks/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /create tasks' do
    context 'with valid parameters' do
      it 'creates a new Task' do
        expect do
          post '/api/v1/tasks', params: { task: { name: 'test', note: 'test', priority: 1 } }, headers: auth_headers
        end.to change(Task, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Task' do
        expect do
          post '/api/v1/tasks', params: { task: { name: nil, note: 'test', priority: 1 } }, headers: auth_headers
        end.to change(Task, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'update a new Task' do
        task = FactoryBot.create :task
        patch api_v1_task_path(id: task.id), params: { task: { name: 'test2' } }, headers: auth_headers
        task.reload
        expect(response).to have_http_status(:ok)
      end

      it 'update a new Task' do
        task = FactoryBot.create :task
        patch api_v1_task_path(id: task.id), params: { task: { name: nil } }, headers: auth_headers
        task.reload
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe 'DELETE /destroy' do
    it 'destroys the requested task' do
      task = FactoryBot.create :task
      expect do
        delete api_v1_task_path(id: task.id), headers: auth_headers
      end.to change(Task, :count).by(-1)
    end
  end
end
