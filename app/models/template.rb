# frozen_string_literal: true

class Template < ApplicationRecord
  belongs_to :user

  validates :name, :body, presence: true
end
