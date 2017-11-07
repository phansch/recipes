# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password '123456'

    trait :default do
      role 'default'
    end

    trait :admin do
      role 'admin'
    end
  end
end
