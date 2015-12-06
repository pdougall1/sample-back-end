require 'rails_helper'

describe 'POST /sessions' do
  let(:password) { 'password' }
  let(:json) { JSON.parse(response.body) }
  let(:email)   { 'good@example.com' }
  let(:payload) {{ identification: email, password: password }}

  context 'when a user is found with the identification' do
    let(:encrypted_password) { Auth::Password.new(password) }
    let!(:user) { FactoryGirl.create(:ar_user, email: email, encrypted_password: encrypted_password) }

    it 'returns the user identification and id' do
      post sessions_path, payload

      expect(response.status).to be(200)
      expect(json.keys).to eq(['authentication_token', 'id'])
    end

    context 'but the password does not fit' do
      let(:payload) {{ identification: email, password: 'phony baloney' }}

      it 'returns a 401' do
        post sessions_path, payload
        expect(response.status).to be(401)
      end
    end
  end

  context 'when a user can not be found' do
    let(:bad_email) { 'bad@example.com' }
    let!(:user) { FactoryGirl.create(:ar_user, email: bad_email) }

    it 'returns a 404' do
      post sessions_path, payload
      expect(response.status).to be(404)
    end
  end
end
