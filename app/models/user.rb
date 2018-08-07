# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  has_many :lists, class_name: 'RecipientList', dependent: :destroy
  has_many :recipients, through: :lists
  has_many :senders, dependent: :destroy
  has_many :templates, dependent: :destroy

  validates :name, presence: true
end
