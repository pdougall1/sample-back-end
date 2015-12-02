require 'rails_helper'

describe AR::Role, type: :model do
  subject(:ar_role) { FactoryGirl.create(:ar_role) }
  it { is_expected.to respond_to :project_user_roles }

  context 'when a technician' do
    let(:role) { FactoryGirl.create(:ar_role, name: 2) }
    subject { role.technician? }
    it { is_expected.to be true }
  end
end
