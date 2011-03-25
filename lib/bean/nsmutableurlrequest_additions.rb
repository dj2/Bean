class NSMutableURLRequest
  def self.post(url, opts)
    req = NSMutableURLRequest.requestWithURL(NSURL.URLWithString(url))
    req.setHTTPMethod('POST')

    if opts[:head]
      opts[:head].each_pair do |k, v|
        req.setValue(v, forHTTPHeaderField:k)
      end
    end

    req.setHTTPBody(opts[:body].to_data) if opts[:body]
    req
  end
end
