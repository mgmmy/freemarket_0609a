# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super and return
  end
end
