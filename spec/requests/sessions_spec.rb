require 'rails_helper'

describe 'POST /sessions' do
  let(:json) { JSON.parse(response.body) }
  let(:email)   { 'good@example.com' }
  let(:payload) {{ identification: email }}

  context 'when a user is found with the identification' do
    let!(:user)   { FactoryGirl.create(:ar_user, email: email) }

    it 'returns the user identification and id' do
      post sessions_path, payload

      expect(response.status).to be(200)
      expect(json.keys).to eq(['authentication_token', 'id'])
    end
  end

  context 'when a user can not be found' do
    let(:bad_email)   { 'bad@example.com' }
    let!(:user)   { FactoryGirl.create(:ar_user, email: bad_email) }

    it 'returns the user identification and id' do
      post sessions_path
      expect(response.status).to be(404)
    end
  end
end
