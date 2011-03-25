class NSIndexSet
  include Enumerable
          
  def each
    i = self.firstIndex
    until i == NSNotFound
      yield i
      i = self.indexGreaterThanIndex(i)
    end
  end
end
