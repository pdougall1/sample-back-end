
  require 'delegate'

  module Query
    class ActiveUserWorkTickets < SimpleDelegator
      def initialize(user, work_tickets_scope: AR::WorkTicket)
        @work_tickets_scope = work_tickets_scope
        super get_work_tickets_scope(user)
      end

      def get_work_tickets_scope(user)
        @work_tickets_scope
          .joins(operation: { project: { project_user_roles: :user }})
          .where(projects: { active: true })
          .where(users: { id: user.id })
      end
    end
  end
