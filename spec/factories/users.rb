FactoryGirl.define do
  factory :ar_user, class: AR::User do
    email "example.user@example.com"
    first_name "Example"
    last_name "User"
  end
end
