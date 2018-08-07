# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipient, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:list).class_name('RecipientList') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
