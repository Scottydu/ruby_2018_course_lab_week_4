require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe '#index' do
    let(:subject) { get :index }

    describe 'no movies' do
      it { is_expected.to have_http_status :ok }

      it 'returns an empty array' do
        subject
        expect(json_response).to be_empty
      end
    end

    describe '20 movies' do
      before do
        20.times { create(:movie) }
      end

      it { is_expected.to have_http_status :ok }

      it 'returns an array' do
        subject
        expect(json_response.count).to eq(20)
      end
    end
  end

  describe '#create' do
    let(:subject) { post :create, params: params }
    let(:params) do
      {
        name: 'New Movie',
        year: 1991
      }
    end

    describe 'movie is valid' do
      it { is_expected.to have_http_status :created }

      it 'creates a new movie' do
        expect do
          subject
        end.to change { Movie.count }.by(1)
      end

      it 'returns the created movie' do
        subject
        expect(json_response['name']).to eq('New Movie')
      end
    end

    describe 'movie is invalid' do
      describe 'empty name' do
        let(:params) do
          {
            name: '',
            year: 1991
          }
        end

        it { is_expected.to have_http_status :unprocessable_entity }

        it 'does not create a new movie' do
          expect do
            subject
          end.to_not change { Movie.count }
        end

        it 'return errors' do
          subject
          expect(json_response['name']).to include("can't be blank")
        end
      end

      describe 'repeated name' do
        let(:params) do
          {
            name: 'Old Movie',
            year: 1991
          }
        end
        before { create(:movie, name: 'Old Movie') }

        it { is_expected.to have_http_status :unprocessable_entity }

        it 'does not create a new movie' do
          expect do
            subject
          end.to_not change { Movie.count }
        end

        it 'return errors' do
          subject
          expect(json_response['name']).to include("has already been taken")
        end
      end
    end
  end
end
