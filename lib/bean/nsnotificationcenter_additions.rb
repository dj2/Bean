class NSNotificationCenter
  def self.post(options)
    NSNotificationCenter.defaultCenter.postNotificationName(options[:name],
                                                     object:options[:object],
                                                   userInfo:options[:info])
  end

  def self.observe(name, &blk)
    @observers ||= []
    @observers << Class.new do
      define_method("call_#{name}") { |notice| blk.call(notice) }
    end.new

    NSNotificationCenter.defaultCenter.addObserver(@observers.last, selector:"call_#{name}:", name:name, object:nil)
  end
end
