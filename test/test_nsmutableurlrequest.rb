require 'test_helper'

class TestNSIndexSet < MiniTest::Unit::TestCase
  def test_post_creation
    p = NSMutableURLRequest.post("http://example.com")

    assert_equal "POST", p.HTTPMethod
    assert_equal "http://example.com", p.URL.absoluteString
  end

  def test_providing_body
    p = NSMutableURLRequest.post("http://example.com", :body => "My Body")
    assert_equal "My Body", p.HTTPBody.to_str
  end

  def test_providing_headers
    p = NSMutableURLRequest.post("http://example.com",
                  :head => { :first => "one",
                             "second" => 2 })
    assert_equal "one", p.valueForHTTPHeaderField("first")
    assert_equal "2", p.valueForHTTPHeaderField("second")
  end
end