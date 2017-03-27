FactoryGirl.define do
    sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email
    password "1234567890"
    first_name "Pdf"
    last_name "Exam"
    admin false
  end
  factory :admin, class: User do
  email
  password "qwertyuiop"
  admin true
  first_name "Admin"
  last_name "User"
end
end
