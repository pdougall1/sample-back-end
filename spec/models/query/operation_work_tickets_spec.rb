require 'rails_helper'

describe Query::OperationWorkTickets do
  let(:active) { true }
  let(:role_name) { 'technician' }
  let(:user) { FactoryGirl.create(:ar_user) }
  let(:project) { FactoryGirl.create(:ar_project, active: active) }
  let(:role) { FactoryGirl.create(:ar_role, name: role_name) }
  let(:operation) { FactoryGirl.create(:ar_operation, project: project) }
  let!(:project_user_role) { FactoryGirl.create(:ar_project_user_role, project: project, user: user, role: role) }
  let!(:work_ticket) { FactoryGirl.create(:ar_work_ticket, operation: operation) }
  subject { described_class.new(operation).pluck(:id) }

  it { is_expected.to eq [work_ticket.id] }

  context 'when the ticket does not belong to the operation' do
    let(:other_operation) { FactoryGirl.create(:ar_operation, project: project) }
    let!(:other_work_ticket) { FactoryGirl.create(:ar_work_ticket, operation: other_operation) }
    it { is_expected.to eq [work_ticket.id] }
  end

  context 'when the work ticket is not active' do
    let(:active) { false }
    it { is_expected.to eq [] }
  end

  context 'when the user is not a technician' do
    let(:role_name) {'operator' }
    it { is_expected.to eq [] }
  end
end
