# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :disable_registration, only: %i[new create]

  def disable_registration
    redirect_to new_user_session_path, status: 301 unless ENV['ENABLE_REGISTRATION'] == 'true'
  end
end
