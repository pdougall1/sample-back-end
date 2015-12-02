module AR
  class WorkTicket < ActiveRecord::Base
    belongs_to :operation
    belongs_to :user
  end
end
