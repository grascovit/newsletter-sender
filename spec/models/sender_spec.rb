# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sender, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:newsletters).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
