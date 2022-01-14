require 'rails_helper'

RSpec.describe 'Report the stats', type: :request do
  subject(:request) { get '/v1/stats' }

  describe 'List the stats' do
    context 'show the mutants stats' do
      before { request }

      it 'returns an ok status' do
        expect(response).to have_http_status :ok
      end

      it 'should not be empty' do
        expect(response.body).to_not be_empty
      end
    end
  end
end
