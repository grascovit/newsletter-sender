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

  describe '#flash_class' do
    subject { helper.flash_class(type) }

    context 'when flash type is alert' do
      let(:type) { 'alert' }

      it { is_expected.to eq('alert-danger') }
    end

    context 'when flash type is notice' do
      let(:type) { 'notice' }

      it { is_expected.to eq('alert-primary') }
    end
  end
end
