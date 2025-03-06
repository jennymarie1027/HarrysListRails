FactoryBot.define do
    factory :post do
        association :user, factory: [:user, :with_posts]
        sequence(:title) { |n| 'test title #' + n.to_s }
        price { 100 } # why is price 100.0 in the response?
        category { 'Furniture' }
        description { 'this is a test description ...' }
        image { 'https://images.unsplash.com/photo-1731412924028-204b15ca8f1d?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' }
        file { 'file' }
        location { 'Denver' }
        is_fave { false }
    end

end