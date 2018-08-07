# frozen_string_literal: true

class Sender < ApplicationRecord
  has_many :newsletters, dependent: :destroy
  belongs_to :user

  validates :name, :email, presence: true
end
