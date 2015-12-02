module AR
  class WorkTicket < ActiveRecord::Base
    belongs_to :operation
  end
end
