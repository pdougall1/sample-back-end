require 'rails_helper'

describe AR::Role, type: :model do
  subject(:ar_role) { FactoryGirl.create(:ar_role) }
  it { is_expected.to respond_to :project_user_roles }
end
