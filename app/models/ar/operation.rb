module AR
  class Operation < ActiveRecord::Base
    belongs_to :project
  end
end
