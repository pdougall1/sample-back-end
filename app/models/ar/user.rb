module AR
  class User < ActiveRecord::Base
    has_many :project_user_roles
  end
end
