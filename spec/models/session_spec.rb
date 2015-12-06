require 'rails_helper'

describe Session do
  let(:auth_token) { Auth::Token.new }
  let(:initial_password) { 'password' }
  let(:password) { Auth::Password.new(initial_password) }
  let(:token_from_client) { auth_token.to_s }
  let(:email) { 'user@example.com' }
  let(:user) { FactoryGirl.create(:ar_user, email: email,
                                            hashed_auth_token: auth_token.to_hash,
                                            encrypted_password: password.to_s) }
  let(:session) { described_class.new(user.email, 'password') }

  describe '#token_valid?(token_from_client)' do
    subject { session.token_valid?(token_from_client) }
    it { is_expected.to be true }

    context 'when auth_token is not valid' do
      let(:token_from_client) { Auth::Token.new.to_s }
      it { is_expected.to be false }
    end
  end

  describe '#password_valid?(password_from_client)' do
    let(:password_from_client) { 'password' }
    subject { session.password_valid?(password_from_client) }
    it { is_expected.to be true }

    context 'when password is not valid' do
      let(:password_from_client) { 'not password' }
      it { is_expected.to be false }
    end
  end
end
