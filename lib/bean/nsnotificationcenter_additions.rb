# Extensions to the NSNotificationCenter class
class NSNotificationCenter
  #
  # Post a notification to the default center.
  #
  # NSNotificationCenter.post provides a convenience wrapper around
  # posting messages to the defaultCenter.
  #
  # @example
  #   NSNotificationCenter.post(:name => :my_message, :info => {:hi => 1})
  #
  # @param options [Hash] Options for the notification
  # @option options [String|Symbol] :name The notification name to send
  # @option options [String] :object The object to send
  # @option options [String] :info The userInfo to send
  # @return [nil]
  def self.post(options)
    NSNotificationCenter.defaultCenter.postNotificationName(options[:name],
                                                     object:options[:object],
                                                   userInfo:options[:info])
  end

  #
  # Setup an observer for the given notification and execute block when seen. Then
  # block will be passed the notification object.
  #
  # @example
  #   NSNotificationCenter.observe(:my_message) do |notice|
  #     puts "My Message Received: #{notice.userInfo.inspect}"
  #   end
  #
  # @param name [String|Symbol] The notification name to listen for
  # @param blk [Proc] The block to execute when notification is +received
  # @return [nil]
  def self.observe(name, &blk)
    @observers ||= []
    @observers << Class.new do
      define_method("call_#{name}") { |notice| blk.call(notice) }
    end.new

    NSNotificationCenter.defaultCenter.addObserver(@observers.last, selector:"call_#{name}:", name:name, object:nil)
  end
end
