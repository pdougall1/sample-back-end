require 'rails_helper'

describe AR::ProjectUserRole, type: :model do
  subject(:project_user_role) { FactoryGirl.create(:ar_project_user_role) }
  it { is_expected.to respond_to :project }
  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :role }
end
