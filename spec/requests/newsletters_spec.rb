# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Newsletters', type: :request do
  let(:user) { create(:user) }
  let(:list) { create(:recipient_list, user: user) }
  let(:sender) { create(:sender, user: user) }
  let(:template) { create(:template, user: user) }
  let!(:newsletter) do
    create(:newsletter, list: list, sender: sender, template: template)
  end
  let(:valid_attributes) do
    {
      newsletter: {
        title: 'Newsletter',
        body: 'Body',
        list_id: list.id,
        sender_id: sender.id,
        template_id: template.id
      }
    }
  end
  let(:invalid_attributes) do
    {
      newsletter: {
        title: '',
        body: '',
        list_id: '',
        sender_id: '',
        template_id: ''
      }
    }
  end

  before do
    user.confirm
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get newsletters_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_newsletter_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get newsletter_path(newsletter)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_newsletter_path(newsletter)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new recipient newsletter' do
        expect do
          post newsletters_path, params: valid_attributes
        end.to change(Newsletter, :count).by(1)
      end

      it 'redirects to the newsletters page' do
        post newsletters_path, params: valid_attributes

        expect(response).to redirect_to(newsletters_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new newsletter' do
        expect do
          post newsletters_path, params: invalid_attributes
        end.not_to change(Newsletter, :count)
      end

      it 'renders the newsletter form again' do
        post newsletters_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          newsletter: {
            title: 'New title'
          }
        }
      end

      it 'updates the requested newsletter' do
        expect do
          put newsletter_path(newsletter), params: new_attributes
          newsletter.reload
        end.to change(newsletter, :title).from(newsletter.title).to('New title')
      end

      it 'redirects to the newsletters page' do
        put newsletter_path(newsletter), params: new_attributes
        newsletter.reload

        expect(response).to redirect_to(newsletters_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the newsletter' do
        old_title = newsletter.title
        put newsletter_path(newsletter), params: invalid_attributes
        newsletter.reload

        expect(newsletter.title).to eq(old_title)
      end

      it 'renders the newsletter form again' do
        put newsletter_path(newsletter), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested newsletter' do
      expect do
        delete newsletter_path(newsletter)
      end.to change(Newsletter, :count).by(-1)
    end

    it 'redirects to the newsletters page' do
      delete newsletter_path(newsletter)

      expect(response).to redirect_to(newsletters_path)
    end
  end
end
