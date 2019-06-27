# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
