# frozen_string_literal: true

require 'rails_helper'

module Newsletters
  RSpec.describe 'Sendings', type: :request do
    let(:user) { create(:user) }
    let(:sender) { create(:sender, user: user) }
    let(:newsletter) { create(:newsletter, sent_at: nil, sender: sender) }
    let(:service) { instance_double(Newsletters::Send) }

    before do
      allow(Newsletters::Send).to receive(:new).and_return(service)
      user.confirm
      sign_in(user)
    end

    describe 'POST #create' do
      context 'when send service returns true' do
        before do
          allow(service).to receive(:call).and_return(true)
          post newsletter_sendings_path(newsletter)
        end

        it 'redirects to the newsletters page with success message' do
          expect(response).to redirect_to(newsletters_path)
        end

        it 'shows success message' do
          expect(flash[:notice]).to eq(I18n.t('newsletters.sendings.create.success'))
        end
      end

      context 'when send service returns false' do
        before do
          allow(service).to receive(:call).and_return(false)
          post newsletter_sendings_path(newsletter)
        end

        it 'redirects to the newsletters page' do
          expect(response).to redirect_to(newsletters_path)
        end

        it 'shows failure message' do
          expect(flash[:alert]).to eq(I18n.t('newsletters.sendings.create.failure'))
        end
      end
    end
  end
end
