require 'rails_helper'

describe Query::UserOperations do
  let!(:project) { FactoryGirl.create(:ar_project) }
  let!(:user) { FactoryGirl.create(:ar_user) }
  let!(:project_user_role) { FactoryGirl.create(:ar_project_user_role, project: project, user: user) }
  let!(:operation) { FactoryGirl.create(:ar_operation, project: project) }
  subject(:user_operations_ids) { described_class.new(user).pluck(:id) }

  it { is_expected.to eq [user.id] }
end
