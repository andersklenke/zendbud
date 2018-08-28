require 'rails_helper'

RSpec.describe 'Viewer', type: :request do
  let(:request!) { post '/graphql', params: { query: query } }

  let(:query) do
    %(
      query {
        viewer {
          __typename
          email
          id
          name
        }
      }
    )
  end

  let(:data) { JSON.parse(response.body)['data'] }

  context "when there's no current user" do
    it 'returns nil' do
      request!
      expect(data['viewer']).to eq nil
    end
  end

  context 'when there is a user' do
    let(:user) { FactoryBot.create :user }

    before { sign_in user }

    it 'returns a correct json' do
      request!
      expect(data['viewer']['__typename']).to eq 'User'
      expect(data['viewer']['email']).to eq user.email
      expect(data['viewer']['name']).to eq user.name
    end
  end
end
