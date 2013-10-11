require 'test/unit'

class SampleTest < Test::Unit::TestCase

  def setup
    puts "\nIngreso a setup"
  end

  def teardown
    puts "Ingreso a teardown"
  end

  def test_1
    assert true
  end

  def test_2
    refute false
  end
end
