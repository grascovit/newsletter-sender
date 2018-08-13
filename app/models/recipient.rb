# frozen_string_literal: true

class Recipient < ApplicationRecord
  belongs_to :list, class_name: 'RecipientList'

  validates :email, presence: true
  validates :email, uniqueness: { scope: :list_id, message: :already_in_list }
end
