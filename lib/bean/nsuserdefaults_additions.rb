class NSUserDefaults
  def self.[]=(key,value)
    standardUserDefaults[key] = value
  end

  def self.[](key)
    standardUserDefaults[key]
  end

  def delete(key)
    standardUserDefaults.delete(key)
  end

  def []=(key, value)
    if value
      setObject(value, forKey:key.to_s)
    else
      delete(key.to_s)
    end
    sync
  end

  def [](key)
    objectForKey(key.to_s)
  end

  def delete(key)
    removeObjectForKey(key)
    sync
  end

  private

  def sync
    puts "Failed to synchronize" unless synchronize
  end
end