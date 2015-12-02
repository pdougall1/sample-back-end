module AR
  class Role < ActiveRecord::Base
    has_many :project_user_roles
    enum name: [:admin, :operator, :technician]
  end
end
