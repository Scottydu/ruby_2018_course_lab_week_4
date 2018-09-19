require 'rails_helper'

RSpec.describe Api::V1::MeController, type: :controller do
  describe "GET #index" do
    subject do
      request.headers.merge(headers)
      get :index
    end
    let(:headers) { { } }

    describe 'logged in user' do
      let(:user) { create(:user) }
      let(:auth_token) { JsonWebToken.encode(user_id: user.id) }
      let(:headers) { {
        'Authorization' => auth_token
       } }

      it { is_expected.to have_http_status :ok }

      it 'is expected to have the user information' do
        subject
        expect(json_response['email']).to eq(user.email)
        expect(json_response['name']).to eq(user.name)
      end
    end

    describe 'unlogged user' do
      it { is_expected.to have_http_status :unauthorized }

      it 'returns errors' do
        subject
        expect(json_response.dig('errors', 'user')).to include('Invalid authentication')
      end
    end
  end
end
