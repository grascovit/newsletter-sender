# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipients', type: :request do
  let(:user) { create(:user) }
  let(:list) { create(:recipient_list, user: user) }
  let!(:recipient) { create(:recipient, list: list) }
  let(:valid_attributes) do
    {
      recipient: {
        name: 'Recipient',
        email: 'recipient@email.com',
        list_id: list.id
      }
    }
  end
  let(:invalid_attributes) do
    {
      recipient: {
        name: '',
        email: '',
        list_id: ''
      }
    }
  end

  before do
    user.confirm
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get recipients_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_recipient_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_recipient_path(recipient)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new recipient' do
        expect do
          post recipients_path, params: valid_attributes
        end.to change(Recipient, :count).by(1)
      end

      it 'redirects to the recipients list' do
        post recipients_path, params: valid_attributes

        expect(response).to redirect_to(recipients_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new recipient' do
        expect do
          post recipients_path, params: invalid_attributes
        end.not_to change(Recipient, :count)
      end

      it 'renders the recipient form again' do
        post recipients_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          recipient: {
            name: 'New name'
          }
        }
      end

      it 'updates the requested recipient' do
        expect do
          put recipient_path(recipient), params: new_attributes
          recipient.reload
        end.to change(recipient, :name).from(recipient.name).to('New name')
      end

      it 'redirects to the recipients list' do
        put recipient_path(recipient), params: new_attributes
        recipient.reload

        expect(response).to redirect_to(recipients_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the recipient' do
        old_name = recipient.name
        put recipient_path(recipient), params: invalid_attributes
        recipient.reload

        expect(recipient.name).to eq(old_name)
      end

      it 'renders the recipient form again' do
        put recipient_path(recipient), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipient' do
      expect do
        delete recipient_path(recipient)
      end.to change(Recipient, :count).by(-1)
    end

    it 'redirects to the recipients list' do
      delete recipient_path(recipient)

      expect(response).to redirect_to(recipients_path)
    end
  end
end
