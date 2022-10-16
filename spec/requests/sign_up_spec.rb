require 'rails_helper'

RSpec.describe '#sign_up' do
  let(:user) { FactoryBot.create :user}

  context 'with valid params' do
    let(:register) do
        post '/auth', params: { email: "example@example.com", password: "123456" }
    end
    it do
      expect do
        register
      end.to change(User, :count).by(1)
    end

    it 'request should be successful' do
      register
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with invalid params' do
    let(:register) do
        post '/auth', params: { email: nil, password: "123456" }
      end
    it do
      expect do
        register
      end.not_to change(User, :count)
    end

    it 'request should be successful' do
      register
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end