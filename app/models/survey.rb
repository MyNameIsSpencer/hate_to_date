class Survey < ApplicationRecord
  has_many :results
  has_many :questions
end
