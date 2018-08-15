# frozen_string_literal: true

module Newsletters
  class SendingsController < ApplicationController
    before_action :fetch_newsletter, only: %i[create]
    before_action :render_body, only: %i[create]

    def create
      service = Newsletters::Send.new(@newsletter)

      if service.call
        redirect_to newsletters_path, notice: t('.success')
      else
        redirect_to newsletters_path, alert: t('.failure')
      end
    end

    private

    def fetch_newsletter
      @newsletter = current_user.newsletters.find(params[:newsletter_id])
    end

    def render_body
      Newsletters::RenderBody.new(@newsletter).call
    end
  end
end
