require 'rails_helper'

RSpec.describe 'Create a dna', type: :request do
  let(:mutant) { mutants(:base) }
  subject(:request) { post '/v1/mutants', params: payload }
  let(:payload) { JSON.parse(File.read('spec/fixtures/payloads/mutant.json.erb')).as_json }

  describe 'Creates a dna' do
    context 'when the request is valid' do
      context 'and is a mutant' do
        it 'returns a created status' do
          request
          expect(response).to have_http_status :ok
        end

        it 'creates an dna' do
          expect { request }.to change(Mutant, :count).by(1)
        end
      end

      context 'is a human' do
        before { payload['dna'].pop }

        it 'returns a created status' do
          request
          expect(response).to have_http_status :forbidden
        end

        it 'returns a message' do
          request
          expect(response.body).to include(I18n.t('errors.mutant.is_human'))
        end
      end
    end

    context 'when the request is invalid' do
      before { payload[:dna] = nil }

      it 'returns a bad_request status' do
        request
        expect(response).to have_http_status :bad_request
      end
    end
  end
end
