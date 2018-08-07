# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipientListsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recipient_lists').to route_to('recipient_lists#index')
    end

    it 'routes to #new' do
      expect(get: '/recipient_lists/new').to route_to('recipient_lists#new')
    end

    it 'routes to #show' do
      expect(get: '/recipient_lists/1').to route_to('recipient_lists#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recipient_lists/1/edit').to route_to('recipient_lists#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recipient_lists').to route_to('recipient_lists#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recipient_lists/1').to route_to('recipient_lists#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recipient_lists/1').to route_to('recipient_lists#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recipient_lists/1').to route_to('recipient_lists#destroy', id: '1')
    end
  end
end
