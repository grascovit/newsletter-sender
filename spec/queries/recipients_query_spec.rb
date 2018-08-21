# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipientsQuery, type: :query do
  subject { described_class.new.filter(params) }

  let!(:recipient) { create(:recipient, email: 'test@test.com') }
  let!(:recipient2) { create(:recipient, email: 'other@other.com') }

  describe '#filter' do
    context 'when informing email param' do
      let(:params) do
        {
          email: 'test'
        }
      end

      it { is_expected.to match_array([recipient]) }
    end

    context 'when not informing any params' do
      let(:params) do
        {}
      end

      it { is_expected.to match_array([recipient, recipient2]) }
    end
  end
end
