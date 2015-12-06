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
end
