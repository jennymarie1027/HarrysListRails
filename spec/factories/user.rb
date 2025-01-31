FactoryBot.define do
    factory :user do
        sequence(:email) { |n| 'rspec_test_user' + n.to_s + '@test.com' }
        password { 'password' }
    end

    factory :invalid_user do
        sequence(:invalid_user) { |n| 'rspec_test_user' + n.to_s + '@test.com' }
    end
end