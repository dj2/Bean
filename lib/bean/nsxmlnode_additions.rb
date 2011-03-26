# Extensions to the NSXMLNode class
class NSXMLNode
  alias to_xml XMLString

  #
  # Returns the child at the given index.
  #
  # @param key [Fixnum] The child index to retrieve
  # @return [NSXMLNode] The node at the given child index.
  def [](key)
    childAtIndex(key)
  end

  #
  # Returns the number of children for this code
  #
  # @return [Fixnum] The number of child nodes
  def length
    childCount
  end
end