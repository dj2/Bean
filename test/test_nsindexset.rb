require 'test_helper'

class TestNSIndexSet < MiniTest::Unit::TestCase
  def test_each_iterates
    s = NSIndexSet.indexSetWithIndexesInRange(NSMakeRange(0, 10))
    count = 0
    s.each { |i| count += 1 }
    assert_equal 10, count
  end

  def test_provides_index
    s = NSIndexSet.indexSetWithIndexesInRange(NSMakeRange(5, 2))
    indexes = []
    s.each { |i| indexes << i }
    assert_equal [5, 6], indexes
  end
end