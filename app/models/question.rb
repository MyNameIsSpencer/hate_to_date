class Question < ApplicationRecord
  validates :option_a, :option_b, presence: true
  validates :option_a, :option_b, uniqueness: true
  validate  :a_not_b
    def a_not_b
      if option_a == option_b
        errors.add(:options, 'Options must be different')
      end
    end

  belongs_to :survey
end
