# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :disable_registration, only: %i[new create]

  private

  def disable_registration
    unless ENV['ENABLE_REGISTRATION'] == 'true'
      redirect_to unauthenticated_root_path
    end
  end
end
