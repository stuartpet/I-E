# frozen_string_literal: true

FactoryBot.define do
  factory :ie_statement do
    user {}
    income { 10_000 }
    expenditure { 9_333 }
  end
end
