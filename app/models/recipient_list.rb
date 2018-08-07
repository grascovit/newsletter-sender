# frozen_string_literal: true

class RecipientList < ApplicationRecord
  has_many :recipients, foreign_key: 'list_id', dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
