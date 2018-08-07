# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RecipientLists', type: :request do
  let(:user) { create(:user) }
  let!(:list) { create(:recipient_list, user: user) }
  let(:valid_attributes) do
    {
      recipient_list: {
        name: 'List',
        user_id: user.id
      }
    }
  end
  let(:invalid_attributes) do
    {
      recipient_list: {
        name: '',
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
      get recipient_lists_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_recipient_list_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get recipient_list_path(list)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_recipient_list_path(list)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new recipient list' do
        expect do
          post recipient_lists_path, params: valid_attributes
        end.to change(RecipientList, :count).by(1)
      end

      it 'redirects to the lists page' do
        post recipient_lists_path, params: valid_attributes

        expect(response).to redirect_to(recipient_lists_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new list' do
        expect do
          post recipient_lists_path, params: invalid_attributes
        end.not_to change(RecipientList, :count)
      end

      it 'renders the list form again' do
        post recipient_lists_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          recipient_list: {
            name: 'New name'
          }
        }
      end

      it 'updates the requested list' do
        expect do
          put recipient_list_path(list), params: new_attributes
          list.reload
        end.to change(list, :name).from(list.name).to('New name')
      end

      it 'redirects to the lists page' do
        put recipient_list_path(list), params: new_attributes
        list.reload

        expect(response).to redirect_to(recipient_lists_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the list' do
        old_name = list.name
        put recipient_list_path(list), params: invalid_attributes
        list.reload

        expect(list.name).to eq(old_name)
      end

      it 'renders the list form again' do
        put recipient_list_path(list), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested list' do
      expect do
        delete recipient_list_path(list)
      end.to change(RecipientList, :count).by(-1)
    end

    it 'redirects to the lists page' do
      delete recipient_list_path(list)

      expect(response).to redirect_to(recipient_lists_path)
    end
  end
end
