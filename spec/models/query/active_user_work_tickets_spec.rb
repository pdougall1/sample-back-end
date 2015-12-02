require 'rails_helper'

describe Query::ActiveUserWorkTickets do
  let(:user) { FactoryGirl.create(:ar_user) }
  let!(:project_user_role) { FactoryGirl.create(:ar_project_user_role, project: project, user: user) }
  let!(:project) { FactoryGirl.create(:ar_project, active: active) }
  let!(:operation) { FactoryGirl.create(:ar_operation, project: project) }
  let!(:work_ticket) { FactoryGirl.create(:ar_work_ticket, operation: operation) }

  subject { described_class.new(user).pluck(:id) }

  context 'when the work ticket is active' do
    let(:active) { true }
    it { is_expected.to eq [work_ticket.id] }
  end

  context 'when the work ticket is not active' do
    let(:active) { false }
    it { is_expected.to eq [] }
  end
end
