require 'rails_helper'

describe AR::WorkTicket, type: :model do
  subject(:work_ticket) { FactoryGirl.create(:ar_work_ticket) }
  it { is_expected.to respond_to :operation }
end
