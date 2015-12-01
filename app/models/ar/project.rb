module AR
  class Project < ActiveRecord::Base
    has_many :project_user_roles
  end
end
