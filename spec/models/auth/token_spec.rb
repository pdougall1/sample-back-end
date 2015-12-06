require 'spec_helper'
require 'scrypt'
require_relative '../../../app/models/auth/token'

describe Auth::Token do
  let(:random_str) { 'random_str' }
  let(:random_factory) { double('SecureRandom', base64: random_str) }
  let(:token) { described_class.new(random_factory: random_factory) }

  describe '#to_s' do
    subject { token.to_s }
    it { is_expected.to eq random_str }
  end

  describe '#to_hash' do
    subject { SCrypt::Password.new(token.to_hash) }
    it { is_expected.to eq random_str }
  end

  context 'when passed a token string' do
    let(:token) { described_class.new(random_str, random_factory: random_factory) }

    describe '#to_s' do
      subject { token.to_s }
      it { is_expected.to eq random_str }
    end

    describe '#to_hash' do
      subject { token.to_hash }
      it { is_expected.to eq '' }
    end

    describe '#matches?(hashed_string)' do
      let(:hashed_string) { SCrypt::Password.create(random_str).to_s }
      subject { token.matches?(hashed_string) }
      it { is_expected.to be true }
    end
  end
end
