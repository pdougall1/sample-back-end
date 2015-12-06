require 'rails_helper'

describe User do
  subject(:user) { described_class.new() }

  describe '#create(params)' do
    let(:params) {{email: 'user@example.com',
                   first_name: 'Example',
                   last_name: 'user',
                   password: 'password',
                   password_confirmation: 'password'}}
    it 'persists user data' do
      expect{ user.create(params) }.to change { AR::User.count }.by 1
    end

    it 'encrypts the password' do
      user.create(params)
      ar_user = AR::User.last
      password = SCrypt::Password.new(ar_user.encrypted_password)
      expect(password).to eq(params[:password])
    end
  end
end
