# frozen_string_literal: true

class RecipientList < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
