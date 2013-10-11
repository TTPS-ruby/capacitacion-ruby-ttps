require 'roman'
require 'test/unit'
class TestRoman < MiniTest::Unit::TestCase
  def test_simple
    assert_equal("i", Roman.new(1).to_s)
    assert_equal("ix", Roman.new(9).to_s)
  end
end
