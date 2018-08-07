# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it do
      is_expected.to have_many(:lists)
        .class_name('RecipientList')
        .dependent(:destroy)
    end
    it { is_expected.to have_many(:newsletters).through(:senders) }
    it { is_expected.to have_many(:recipients).through(:lists) }
    it { is_expected.to have_many(:senders).dependent(:destroy) }
    it { is_expected.to have_many(:templates).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
