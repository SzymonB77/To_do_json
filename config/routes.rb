# frozen_string_literal: true

module Api
  module V1
    Rails.application.routes.draw do
      mount_devise_token_auth_for 'User', at: 'auth'

      namespace :api do
        namespace :v1 do
          resources :lists
          resources :tasks do
            resources :subtasks, only: %i[create update destroy]
            member do
              post :add_list
              delete :delete_list
            end
          end
        end
      end

      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
