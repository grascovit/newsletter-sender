# frozen_string_literal: true

class SendersController < ApplicationController
  before_action :fetch_sender, only: %i[edit update destroy]

  def index
    @senders = current_user.senders
  end

  def new
    @sender = current_user.senders.build
  end

  def edit; end

  def create
    @sender = current_user.senders.new(sender_params)

    if @sender.save
      redirect_to senders_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @sender.update(sender_params)
      redirect_to senders_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @sender.destroy

    redirect_to senders_path, notice: t('.success')
  end

  private

  def fetch_sender
    @sender = current_user.senders.find(params[:id])
  end

  def sender_params
    params.require(:sender).permit(
      :name,
      :email
    )
  end
end
