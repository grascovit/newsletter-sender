# frozen_string_literal: true

class RecipientsQuery
  attr_reader :relation

  def initialize(relation = Recipient.all)
    @relation = relation
  end

  def filter(params = {})
    result = relation.includes(:list).order(:name, :email)
    result = result.by_email(params[:email]) if params[:email].present?
    result
  end
end
