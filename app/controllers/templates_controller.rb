# frozen_string_literal: true

class TemplatesController < ApplicationController
  before_action :fetch_template, only: %i[show edit update destroy]

  def index
    @templates = current_user.templates
  end

  def new
    @template = current_user.templates.build
  end

  def show; end

  def edit; end

  def create
    @template = current_user.templates.new(template_params)

    if @template.save
      redirect_to templates_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @template.update(template_params)
      redirect_to templates_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @template.destroy

    redirect_to templates_path, notice: t('.success')
  end

  private

  def fetch_template
    @template = current_user.templates.find(params[:id])
  end

  def template_params
    params.require(:template).permit(
      :name,
      :body
    )
  end
end
