# Extensions to the NSURLConnection class
class NSURLConnection
  #
  # Helper method for creating a NSURLConnection.
  #
  # Using this method will cause the URL Connection to use itself
  # as the delegate. You can then add error and success handlers to
  # be called when the download is finished.
  #
  # @param req [NSURLRequest] The URL Request
  # @param blk [Proc] The success block to hookup
  # @return [NSURLConnection] The URL Connection
  def initWithRequest(req, &blk)
    @error = nil
    @response = nil

    @on_error = nil
    @on_success = blk
    @data = NSMutableData.data

    initWithRequest(req, delegate:self)
  end

  #
  # Attach an error handler to the connection.
  #
  # The error handler will be executed in case of a connection
  # error. The handler can be attached after the connection is
  # completed.
  #
  # @param blk [Proc] The block to execute
  # @return [Nil]
  def on_error(&blk)
    @on_error = blk
    @on_error.call(@error) if @error
  end

  #
  # Attach a success handler to the connection.
  #
  # The success handler will be executed when the connection is
  # complete. The handler can be attached after the connection is
  # completed.
  #
  # @param blk [Proc] The block to execute
  # @return [Nil]
  def on_success(&blk)
    @on_success = blk
    @on_success.call(@response) if @response
  end

  # Response received callback
  # @api private
  def connection(conn, didReceiveResponse:resp)
    @data.setLength(0)
  end

  # Data received callback
  # @api private
  def connection(conn, didReceiveData:rcv)
    @data.appendData(rcv)
  end

  # Connection failed callback
  # @api private
  def connection(conn, didFailWithError:error)
    return unless @on_error
    @on_error.call(error)
    @error = error
  end

  # Connection finished callback
  # @api private
  def connectionDidFinishLoading(conn)
    @response = NSString.alloc.initWithData(@data, encoding:NSUTF8StringEncoding)
    @on_success.call(@response) if @on_success
    @data = nil
  end
end