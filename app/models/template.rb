# frozen_string_literal: true

class Template < ApplicationRecord
  has_many :newsletters, dependent: :nullify
  belongs_to :user

  validates :name, :body, presence: true
end
