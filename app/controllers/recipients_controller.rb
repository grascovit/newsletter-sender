# frozen_string_literal: true

class RecipientsController < ApplicationController
  before_action :fetch_recipient, only: %i[edit update destroy]

  def index
    @recipients = current_user.recipients
                              .includes(:list)
                              .order(:name)
                              .page(params[:page])
  end

  def new
    @recipient = current_user.recipients.build
  end

  def edit; end

  def create
    @recipient = current_user.recipients.new(recipient_params)

    if @recipient.save
      redirect_to recipients_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @recipient.update(recipient_params)
      redirect_to recipients_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @recipient.destroy

    redirect_to recipients_path, notice: t('.success')
  end

  private

  def fetch_recipient
    @recipient = current_user.recipients.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(
      :name,
      :email,
      :list_id
    )
  end
end
