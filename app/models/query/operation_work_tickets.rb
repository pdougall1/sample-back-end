  require 'delegate'

  module Query
    class OperationWorkTickets < SimpleDelegator

      def initialize(operation)
        super get_work_tickets_scope(operation)
      end

      def get_work_tickets_scope(operation)
        operation.work_tickets
          .joins(operation: { project:
            { project_user_roles: :user,
              project_user_roles: :role
            }})
          .where(projects: { active: true })
          .where(roles: { name: 2 })
      end
    end
  end
