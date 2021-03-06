# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipientList, type: :model do
  describe 'associations' do
    it do
      expect(subject).to have_many(:recipients)
        .with_foreign_key('list_id')
        .dependent(:destroy)
    end

    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
