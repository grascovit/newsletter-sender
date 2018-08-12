# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#active_item' do
    subject { helper.active_item('newsletters') }

    before do
      allow(helper).to receive(:controller_name).and_return(controller_name)
    end

    context 'when user visits a page within the specified controller' do
      let(:controller_name) { 'newsletters' }

      it { is_expected.to eq('active') }
    end

    context 'when user visits another page' do
      let(:controller_name) { 'recipients' }

      it { is_expected.to be_nil }
    end
  end
end
