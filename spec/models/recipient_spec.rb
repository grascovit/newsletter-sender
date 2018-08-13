# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipient, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:list).class_name('RecipientList') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it do
      is_expected.to validate_uniqueness_of(:email)
        .scoped_to(:list_id)
        .with_message(I18n.t('activerecord.errors.messages.already_in_list'))
    end
  end
end
