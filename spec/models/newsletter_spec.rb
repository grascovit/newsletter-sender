# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Newsletter, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:list).class_name('RecipientList') }
    it { is_expected.to belong_to(:sender) }
    it { is_expected.to belong_to(:template) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
