# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Templates', type: :request do
  let(:user) { create(:user) }
  let!(:template) { create(:template, user: user) }
  let(:valid_attributes) do
    {
      template: {
        name: 'Template',
        body: 'Body',
        user_id: user.id
      }
    }
  end
  let(:invalid_attributes) do
    {
      template: {
        name: '',
        body: '',
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
      get templates_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_template_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get template_path(template)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_template_path(template)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new recipient template' do
        expect do
          post templates_path, params: valid_attributes
        end.to change(Template, :count).by(1)
      end

      it 'redirects to the templates page' do
        post templates_path, params: valid_attributes

        expect(response).to redirect_to(templates_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new template' do
        expect do
          post templates_path, params: invalid_attributes
        end.not_to change(Template, :count)
      end

      it 'renders the template form again' do
        post templates_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          template: {
            name: 'New name'
          }
        }
      end

      it 'updates the requested template' do
        expect do
          put template_path(template), params: new_attributes
          template.reload
        end.to change(template, :name).from(template.name).to('New name')
      end

      it 'redirects to the templates page' do
        put template_path(template), params: new_attributes
        template.reload

        expect(response).to redirect_to(templates_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the template' do
        old_name = template.name
        put template_path(template), params: invalid_attributes
        template.reload

        expect(template.name).to eq(old_name)
      end

      it 'renders the template form again' do
        put template_path(template), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested template' do
      expect do
        delete template_path(template)
      end.to change(Template, :count).by(-1)
    end

    it 'redirects to the templates page' do
      delete template_path(template)

      expect(response).to redirect_to(templates_path)
    end
  end
end
