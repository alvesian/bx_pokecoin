# frozen_string_literal: true

Rails.application.routes.draw do
  root "transactions#index"
  
  resources :transactions
end
