# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :fetch_newsletter, only: %i[show edit update destroy]
  before_action :render_body, only: %i[show]

  def index
    @newsletters = current_user.newsletters
  end

  def new
    @newsletter = current_user.newsletters.build
  end

  def show; end

  def edit; end

  def create
    @newsletter = current_user.newsletters.new(newsletter_params)

    if @newsletter.save
      redirect_to newsletters_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @newsletter.update(newsletter_params)
      redirect_to newsletters_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @newsletter.destroy

    redirect_to newsletters_path, notice: t('.success')
  end

  private

  def fetch_newsletter
    @newsletter = current_user.newsletters.find(params[:id])
  end

  def render_body
    Newsletters::RenderBody.new(@newsletter).call
  end

  def newsletter_params
    params.require(:newsletter).permit(
      :title,
      :body,
      :list_id,
      :sender_id,
      :template_id
    )
  end
end
