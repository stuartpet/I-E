# frozen_string_literal: true

class IeStatement < ApplicationRecord
  belongs_to :user

  before_save :calculate_disposable_income_and_rating

  private

  def calculate_disposable_income_and_rating
    self.disposable_income = income - expenditure
    ratio = expenditure / income

    self.rating = case ratio
                  when 0..0.1 then 'A'
                  when 0.1..0.3 then 'B'
                  when 0.3..0.5 then 'C'
                  else 'D'
                  end
  end
end
