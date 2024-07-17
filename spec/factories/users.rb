# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'john@email_provider.com' }
    password { SecureRandom.base64 }
  end
end