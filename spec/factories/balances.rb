FactoryGirl.define do
  factory :balance do
    amount { rand(10_000..100_000) }
    invested { rand(10_000..100_000) }
    profit_percent { rand(100) / 100.0 }

    # after(:build, &:skip_confirmation_notification!)
    # after(:create, &:confirm)

    # email { FFaker::Internet.email }
    # password { FFaker::Internet.password(8) }
    # password_confirmation { password }
  end
end
