require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    create(:survey, id:1)
  end


  test "option_a is present" do
    question = build(:question, option_a: nil, option_b: 'no more')
    question2 = build(:question, option_a: '', option_b: 'arebadarchi')
    question3 = build(:question, survey_id: 1)
    refute question.valid?
    refute question2.valid?
    assert question3.valid?
  end
  #
  # test "option_b is present" do
  #   question = build(:question, option_a: nil)
  #   question2 = build(:question, option_a: '')
  #   question3 = build(:question, option_a: 'hello', option_b: 'goodbye')
  #   # refute question.valid?
  #   # refute question2.valid?
  #   assert question3.valid?
  # e
  # end
  #
  # test "option_a and option_b are different" do
  #
  # end
end
