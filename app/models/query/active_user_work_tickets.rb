
  require 'delegate'

  module Query
    class ActiveUserWorkTickets < SimpleDelegator
      def initialize(user)
        super get_work_tickets_scope(user)
      end

      def get_work_tickets_scope(user)
        user.work_tickets
          .joins(operation: :project)
          .where(projects: { active: true })
      end
    end
  end
