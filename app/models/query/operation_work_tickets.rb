require 'delegate'

module Query
  class OperationWorkTickets < SimpleDelegator

    def initialize(operation, work_tickets_scope: AR::WorkTicket)
      @work_tickets_scope = work_tickets_scope
      super get_work_tickets_scope(operation)
    end

    def get_work_tickets_scope(operation)
      @work_tickets_scope
        .joins(operation: { project: { project_user_roles: :user, project_user_roles: :role }})
        .where(projects: { active: true })
        .where(operations: { id: operation.id })
        .where(roles: { name: 2 })
    end
  end
end
