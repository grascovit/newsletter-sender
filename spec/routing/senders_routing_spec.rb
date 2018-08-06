# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/senders').to route_to('senders#index')
    end

    it 'routes to #new' do
      expect(get: '/senders/new').to route_to('senders#new')
    end

    it 'routes to #edit' do
      expect(get: '/senders/1/edit').to route_to('senders#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/senders').to route_to('senders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/senders/1').to route_to('senders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/senders/1').to route_to('senders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/senders/1').to route_to('senders#destroy', id: '1')
    end
  end
end
