# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title 'A nice Recipe'
    work_duration 20
    cooking_duration 20
    difficulty 'easy'
    instructions 'Just cut and cook.'
  end
end
