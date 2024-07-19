# frozen_string_literal: true

class IeStatement < ApplicationRecord
  belongs_to :user

  validates :income, presence: true
  validates :expenditure, presence: true

  def disposable_income
    income - expenditure
  end

  def rating
    ratio = expenditure / income

    case ratio
    when 0..0.1 then 'A'
    when 0.1..0.3 then 'B'
    when 0.3..0.5 then 'C'
    else 'D'
    end
  end
end
