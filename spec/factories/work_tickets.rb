FactoryGirl.define do
  factory :ar_work_ticket, class: AR::WorkTicket do
    operation_id 1
    status 1
    user_id 1
  end
end
