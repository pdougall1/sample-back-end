require 'spec_helper'
require_relative '../../app/models/session'
require_relative '../../app/models/auth_token'

describe Session do
  let(:auth_token) { AuthToken.new }
  let(:token_from_client) { auth_token.to_s }
  let(:user) { instance_double('AR::User', hashed_auth_token: auth_token.to_hash) }
  let(:session) { described_class.new(user) }

  describe '#token_valid?(token_from_client)' do
    subject { session.token_valid?(token_from_client) }
    it { is_expected.to be true }

    context 'when auth_token is not valid' do
      let(:token_from_client) { AuthToken.new.to_s }
      it { is_expected.to be false }
    end
  end
end
