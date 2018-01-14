require 'test_helper'

class FsaTest < ActiveSupport::TestCase
  test "name must be present" do
    fsa = build(:fsa, name: nil)
    fsa2 = build(:fsa)
    refute fsa.valid?
    assert fsa2.valid?
  end

end
