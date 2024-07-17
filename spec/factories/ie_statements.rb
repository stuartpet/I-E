# frozen_string_literal: true

FactoryBot.define do
  factory :ie_statement do
    user_id {  }
    income { 10_000 }
    expenditure { 9_333 }
    disposable_income { 200 }
    rating { 'D' }
  end
end