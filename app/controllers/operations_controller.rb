
  class OperationsController
    def show
      @operation = Operation.find(params[:id])
      @work_tickets = OperationWorkTickets.new(operation)
    end
  end
