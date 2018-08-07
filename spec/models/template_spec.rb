# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Template, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:newsletters).dependent(:nullify) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
