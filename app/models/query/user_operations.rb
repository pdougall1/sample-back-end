
  require 'delegate'

  module Query
    class UserOperations < SimpleDelegator
      def initialize(user, operation_scope: AR::Operation)
        @operation_scope = operation_scope
        super get_operations_scope(user)
      end

      def get_operations_scope(user)
        @operation_scope
          .joins(project: { project_user_roles: :user })
          .where(users: { id: user.id })
      end
    end
  end
