require 'rails_helper'

describe AR::User, type: :model do
  subject(:ar_user) { FactoryGirl.create(:ar_user) }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :first_name }
  it { is_expected.to respond_to :last_name }
  it { is_expected.to respond_to :project_user_roles }
end
