class NSXMLNode
  alias to_xml XMLString

  def [](key)
    childAtIndex(key)
  end

  def length
    childCount
  end
end