require 'minitest/spec'
require 'minitest/autorun'

describe 'Some custom test' do

  before do
    puts "\nIngreso a setup"
  end

  after do
    puts "Ingreso a teardown"
  end

  it 'should pass' do
    assert true
  end

  it 'should pass too' do
    refute false
  end
end
