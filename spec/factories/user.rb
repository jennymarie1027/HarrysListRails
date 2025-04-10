FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { 'password' }
    end

    factory :invalid_user, parent: :user do 
        email { nil }
        password { nil }
    end
end