# frozen_string_literal: true

require 'rails_helper'

module Newsletters
  RSpec.describe Send, type: :service do
    describe '#call' do
      subject(:service) { described_class.new(newsletter).call }

      let(:newsletter) do
        create(:newsletter, rendered_body: 'body', sent_at: nil)
      end

      before do
        stub_const('ENV',
                   'MAILER_API_KEY' => 'secret',
                   'MAILER_API_URL' => 'https://api.elasticemail.com/v2')

        stub_request(:post, "#{ENV['MAILER_API_URL']}/email/send")
          .with(options)
          .to_return(response)
      end

      context 'when the api returns successful response' do
        let(:response) do
          {
            body: {
              'success' => true
            }.to_json
          }
        end

        it { is_expected.to be_truthy }

        it 'updates the newsletter sent time' do
          expect do
            service
          end.to change(newsletter, :sent_at)
        end
      end

      context 'when the api returns unsuccessful response' do
        let(:response) do
          {
            body: {
              'success' => false
            }.to_json
          }
        end

        it { is_expected.to be_falsey }

        it 'does not update the newsletter sent time' do
          expect do
            service
          end.not_to change(newsletter, :sent_at)
        end
      end
    end

    private

    def options
      {
        body: {
          apikey: ENV['MAILER_API_KEY'],
          msgFrom: newsletter.sender.email,
          msgFromName: newsletter.sender.name,
          to: newsletter.list.recipients.pluck(:email).join(','),
          subject: newsletter.title,
          bodyHtml: newsletter.rendered_body
        }
      }
    end
  end
end
