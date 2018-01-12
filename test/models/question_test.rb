require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    create(:survey, id:1)
  end


  test "option_a is present" do
    question = build(:question, option_a: nil, option_b: 'no more')
    question2 = build(:question, option_a: '', option_b: 'arebadarchi')
    question3 = build(:question)
    refute question.valid?
    refute question2.valid?
    assert question3.valid?
  end

  test "option_b is present" do
    question = build(:question, option_a: 'The One', option_b: nil)
    question2 = build(:question, option_a: 'Bad Boy', option_b: '')
    question3 = build(:question, option_a: 'hello', option_b: 'goodbye')
    refute question.valid?
    refute question2.valid?
    assert question3.valid?
  end

  test "option_a and option_b are different" do
    question = build(:question, option_a: 'willy-nilly', option_b:'willy-nilly')
    question2 = build(:question, option_a: 'willy-nilly', option_b:'not willy')
    refute question.valid?
    assert question2.valid?
  end
end
