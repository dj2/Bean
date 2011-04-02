class NSTimer
  def self.periodic_timer(interval, data = nil, &blk)
    c = Class.new do |c|
      def c.timer_fired(timer) @timer_cb.call(timer); end
    end
    c.instance_variable_set(:@timer_cb, blk)

    NSTimer.scheduledTimerWithTimeInterval(interval,
                                           target:c,
                                           selector:"timer_fired:",
                                           userInfo:data,
                                           repeats:true)
  end
end