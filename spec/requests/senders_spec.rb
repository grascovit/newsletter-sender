# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Senders', type: :request do
  let(:user) { create(:user) }
  let!(:sender) { create(:sender, user: user) }
  let(:valid_attributes) do
    {
      sender: {
        name: 'Sender',
        email: 'sender@email.com',
        user_id: user.id
      }
    }
  end
  let(:invalid_attributes) do
    {
      sender: {
        name: '',
        email: '',
        user_id: ''
      }
    }
  end

  before do
    user.confirm
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get senders_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_sender_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_sender_path(sender)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new sender' do
        expect do
          post senders_path, params: valid_attributes
        end.to change(Sender, :count).by(1)
      end

      it 'redirects to the senders list' do
        post senders_path, params: valid_attributes

        expect(response).to redirect_to(senders_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new sender' do
        expect do
          post senders_path, params: invalid_attributes
        end.not_to change(Sender, :count)
      end

      it 'renders the sender form again' do
        post senders_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          sender: {
            name: 'New name'
          }
        }
      end

      it 'updates the requested sender' do
        expect do
          put sender_path(sender), params: new_attributes
          sender.reload
        end.to change(sender, :name).from(sender.name).to('New name')
      end

      it 'redirects to the senders list' do
        put sender_path(sender), params: new_attributes
        sender.reload

        expect(response).to redirect_to(senders_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the sender' do
        old_name = sender.name
        put sender_path(sender), params: invalid_attributes
        sender.reload

        expect(sender.name).to eq(old_name)
      end

      it 'renders the sender form again' do
        put sender_path(sender), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested sender' do
      expect do
        delete sender_path(sender)
      end.to change(Sender, :count).by(-1)
    end

    it 'redirects to the senders list' do
      delete sender_path(sender)

      expect(response).to redirect_to(senders_path)
    end
  end
end
