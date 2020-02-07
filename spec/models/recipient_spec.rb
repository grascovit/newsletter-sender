# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipient, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:list).class_name('RecipientList') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }

    it do
      expect(subject).to validate_uniqueness_of(:email)
        .scoped_to(:list_id)
        .with_message(I18n.t('activerecord.errors.messages.already_in_list'))
    end
  end

  describe 'scopes' do
    describe '.by_email' do
      subject { described_class.by_email(query) }

      let!(:recipient) { create(:recipient, email: 'test@test.com') }
      let!(:recipient2) { create(:recipient, email: 'test2@test.com') }

      context 'when the query matches something' do
        let(:query) { 'test' }

        it { is_expected.to match_array([recipient, recipient2]) }
      end

      context 'when the query does not match anything' do
        let(:query) { 'something' }

        it { is_expected.to match_array([]) }
      end
    end
  end
end
