require 'rails_helper'

describe AR::Operation, type: :model do
  subject(:operation) { FactoryGirl.create(:ar_operation) }
  it { is_expected.to respond_to :project }
end
