module AR
  class Operation < ActiveRecord::Base
    belongs_to :project
    has_many :work_tickets
  end
end
