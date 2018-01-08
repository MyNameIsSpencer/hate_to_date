class Question < ApplicationRecord
  validates :option_a, :option_b, presence: true
  validates :option_a, uniqueness: { scope: :option_b }


  belongs_to :survey
end
