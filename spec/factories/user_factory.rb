FactoryBot.define do
  factory :user do
    email 'user@example.com'
    name 'Sample user'
    password 'password'
    password_confirmation 'password'
  end
end
