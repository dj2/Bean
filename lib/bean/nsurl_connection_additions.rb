class NSURLConnection
  def initWithRequest(req, &blk)
    @error = nil
    @response = nil

    @on_error = nil
    @on_success = blk
    @data = NSMutableData.data

    initWithRequest(req, delegate:self)
  end

  def connection(conn, didReceiveResponse:resp)
    @data.setLength(0)
  end

  def connection(conn, didReceiveData:rcv)
    @data.appendData(rcv)
  end

  def connection(conn, didFailWithError:error)
    return unless @on_error
    @on_error.call(error)
    @error = error
  end

  def connectionDidFinishLoading(conn)
    @response = NSString.alloc.initWithData(@data, encoding:NSUTF8StringEncoding)
    @on_success.call(@response) if @on_success
    @data = nil
  end

  def on_error(&blk)
    @on_error = blk
    @on_error.call(@error) if @error
  end

  def on_success(&blk)
    @on_success = blk
    @on_success.call(@response) if @response
  end
end