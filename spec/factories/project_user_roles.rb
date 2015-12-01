FactoryGirl.define do
  factory :ar_project_user_role, class: AR::ProjectUserRole do
    project_id 1
    user_id 1
    role_id 1
  end
end
