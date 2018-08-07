# frozen_string_literal: true

class Newsletter < ApplicationRecord
  belongs_to :list, class_name: 'RecipientList'
  belongs_to :sender
  belongs_to :template

  validates :title, :body, presence: true
end
