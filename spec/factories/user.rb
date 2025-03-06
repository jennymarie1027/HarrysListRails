FactoryBot.define do
    factory :user do
        sequence(:email) { |n| 'rspec_test_user' + n.to_s + '@test.com' }
        password { 'password' }

        trait :with_posts do
            email { "post_author@test.com" }
        end
    end

    factory :invalid_user, parent: :user do 
        email { nil }
        password { nil }
    end
end