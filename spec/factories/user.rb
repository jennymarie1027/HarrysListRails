FactoryBot.define do
    factory :user do
        sequence(:email) { |n| 'rspec_test_user' + n.to_s + '@test.com' }
        password { 'password' }
    end

    factory :invalid_user, parent: :user do 
        email { nil }
        password { nil }
    end
end