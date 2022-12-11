# frozen_string_literal: true

Rails.application.routes.draw do
  get 'serv/index'

  post 'serv/result', to: 'serv#result'
  get 'serv/result'

  root 'serv#index'
end
