# frozen_string_literal: true

require 'rails_helper'

module Newsletters
  RSpec.describe RenderBody, type: :service do
    describe '#call' do
      subject { described_class.new(newsletter).call }

      let(:newsletter) do
        build_stubbed(:newsletter,
                      title: 'title',
                      body: 'body',
                      template: template)
      end

      context 'when the newsletter does not have a template' do
        let(:template) { nil }

        it { is_expected.to eq(newsletter.body) }
      end

      context 'when the newsletter has a template' do
        let(:template) { build_stubbed(:template, body: '%TITLE% %BODY%') }

        it 'assigns the rendered body to the newsletter' do
          expect do
            subject
          end.to change(newsletter, :rendered_body).from(nil).to('title body')
        end
      end
    end
  end
end
