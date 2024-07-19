# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john#{n}@email_provider.com" }
    password { SecureRandom.base64 }
  end
end
