FactoryBot.define do
    factory :user do
        sequence(:email) { |n| 'rspec_test_user' + n.to_s + '@example.com' }
        password { 'password' }
    end
end