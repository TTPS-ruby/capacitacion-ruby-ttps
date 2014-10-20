require_relative 'roman'
require 'minitest/autorun'
require 'minitest/spec'
describe Roman do
  NUMBERS = [
    [ 1, "i" ], [ 2, "ii" ], [ 3, "iii" ],
    [ 4, "iv"], [ 5, "v" ], [ 9, "ix" ]
  ]
  describe 'when arbitrary numbers are converted' do
    it 'must return expected value' do
      NUMBERS.each do |arabic, roman|
        r = Roman.new(arabic)
        assert_equal(roman, r.to_s)
      end
    end
  end

  describe 'limits' do 
  it 'should not raise exceptions for these two' do
    Roman.new(1)
    Roman.new(4999)
  end
  it 'should raise an exception for upper and lower limits' do
    assert_raises(RuntimeError) { Roman.new(0) }
    assert_raises(RuntimeError) { Roman.new(5000) }
  end
  end
end
