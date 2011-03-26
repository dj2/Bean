# Extensions to the NSMutableRequest class
class NSMutableURLRequest
  #
  # Create a POST request
  #
  # @example
  #   req = NSMutableURLRequest.post("https://example.com",
  #                                  :body => "foo=1&bar=2&baz=3",
  #                                  :head => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  #
  # @param url [String] The domain to post too
  # @param opts [Hash] Any options for the post
  # @option opts [String] :body The body to send with the POST request
  # @option opts [Hash] :head Any headers to send with the request
  # @return [NSMutableURLRequest] The request object
  def self.post(url, opts = {})
    req = NSMutableURLRequest.requestWithURL(NSURL.URLWithString(url))
    req.setHTTPMethod('POST')

    if opts[:head]
      opts[:head].each_pair do |k, v|
        req.setValue(v.to_s, forHTTPHeaderField:k.to_s)
      end
    end

    req.setHTTPBody(opts[:body].to_data) if opts[:body]
    req
  end
end
