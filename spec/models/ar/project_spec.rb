require 'rails_helper'

describe AR::Project, type: :model do
  subject(:ar_project) { FactoryGirl.create(:ar_project) }
  it { is_expected.to respond_to :project_user_roles }
  it { is_expected.to respond_to :users }
  it { is_expected.to respond_to :operations }
end
