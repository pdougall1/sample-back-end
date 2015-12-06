require 'spec_helper'
require 'scrypt'
require_relative '../../../app/models/auth/password'

describe Auth::Password do
  let(:password_string) { 'password' }
  let(:password) { described_class.new(password_string) }

  describe '#to_s' do
    subject { SCrypt::Password.new(password.to_s) }
    it { is_expected.to eq password_string }
  end

  describe '#matches?(encypted_password)' do
    context 'when they match' do
      let(:hashed_password) { SCrypt::Password.create(password_string).to_s }
      subject { password.matches?(hashed_password) }
      it { is_expected.to be true }
    end

    context 'when they do not match' do
      let(:hashed_password) { SCrypt::Password.create('not password').to_s }
      subject { password.matches?(hashed_password) }
      it { is_expected.to be false }
    end
  end
end
