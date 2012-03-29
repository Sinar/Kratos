# See: http://richfisher.me/articles/4f154e62bb1ec9018a000006
FactoryGirl.define do

  factory :user do

    sequence(:email) { |n| "user-#{n}@yo.da" }
    password SecureRandom.hex(8)

    after_build do |u|
      u.reset_authentication_token
    end

    trait :admin do
      role :admin
    end

    factory :admin, :traits => [:admin]

  end

end
