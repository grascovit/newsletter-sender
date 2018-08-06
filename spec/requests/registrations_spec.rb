# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'GET #new' do
    context 'when registration is disabled' do
      before do
        ENV['ENABLE_REGISTRATION'] = 'false'
      end

      it 'redirects to the unauthenticated user page' do
        get new_user_registration_path

        expect(response).to redirect_to(unauthenticated_root_path)
      end
    end

    context 'when registration is enabled' do
      before do
        ENV['ENABLE_REGISTRATION'] = 'true'
      end

      it 'returns http success' do
        get new_user_registration_path

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        user: {
          name: 'User',
          email: 'user@email.com',
          password: 'password'
        }
      }
    end
    let(:invalid_params) do
      {
        user: {
          name: '',
          email: '',
          password: ''
        }
      }
    end

    context 'when registration is disabled' do
      before do
        ENV['ENABLE_REGISTRATION'] = 'false'
      end

      it 'redirects to the unauthenticated user page' do
        post user_registration_path, params: valid_params

        expect(response).to redirect_to(unauthenticated_root_path)
      end
    end

    context 'when registration is enabled' do
      before do
        ENV['ENABLE_REGISTRATION'] = 'true'
      end

      context 'and user informs valid params' do
        it 'creates a new user' do
          expect do
            post user_registration_path, params: valid_params
          end.to change(User, :count).by(1)
        end

        it 'redirects to the authenticated user page' do
          post user_registration_path, params: valid_params

          expect(response).to redirect_to(authenticated_root_path)
        end
      end

      context 'and user informs invalid params' do
        it 'does not create a new user' do
          expect do
            post user_registration_path, params: invalid_params
          end.not_to change(User, :count)
        end

        it 'renders the user form again' do
          post user_registration_path, params: valid_params

          expect(response).to redirect_to(unauthenticated_root_path)
        end
      end
    end
  end
end
