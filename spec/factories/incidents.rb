# frozen_string_literal: true

FactoryBot.define do
  factory :incident do
    title { 'Example Incident' }
    description { 'This is an example incident.' }
    status { 'new' }
  end
end
