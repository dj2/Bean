# Extensions to the NSIndexSet class
class NSIndexSet
  include Enumerable

  #
  # Iterate over each of the items in the NSIndexSet
  #
  # @example
  #   s = NSIndexSet.indexSetWithIndexesInRange(NSMakeRange(0, 10))
  #   s.each { |i| puts i }
  #
  # @yield [i] Provides the current index to the given block
  # @yieldparam [Fixnum] i The index
  # @return [nil]
  def each
    i = self.firstIndex
    until i == NSNotFound
      yield i
      i = self.indexGreaterThanIndex(i)
    end
  end
end
