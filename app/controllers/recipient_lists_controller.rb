# frozen_string_literal: true

class RecipientListsController < ApplicationController
  before_action :fetch_list, only: %i[show edit update destroy]

  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end

  def show; end

  def edit; end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      redirect_to recipient_lists_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to recipient_lists_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @list.destroy

    redirect_to recipient_lists_path, notice: t('.success')
  end

  private

  def fetch_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:recipient_list).permit(
      :name
    )
  end
end
