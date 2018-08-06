# frozen_string_literal: true

class Sender < ApplicationRecord
  belongs_to :user

  validates :name, :email, presence: true
end
