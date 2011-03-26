# Extensions to the NSUserDefaults class
class NSUserDefaults
  #
  # Shortcut for setting a key/value into the standardUserDefaults
  #
  # @example
  #    NSUserDefaults[:foo] = 'bar'
  #
  # @param key [String|Symbol] The key to set
  # @param value [Object] The object to set
  # @return [Nil]
  def self.[]=(key, value)
    standardUserDefaults[key] = value
  end

  #
  # Shortcut for retrieving a key from the standardUserDefaults
  #
  # @example
  #    NSUserDefaults[:foo]
  #
  # @param key [String|Symbol] The key to retrieve
  # @return [Object] The value for the given key
  def self.[](key)
    standardUserDefaults[key]
  end

  #
  # Short cut for deleting a key from the standardUserDefaults
  #
  # @example
  #    NSUserDefaults.delete(:foo)
  #
  # @param key [String|Symbol] The key to delete
  # @return [Nil]
  def delete(key)
    standardUserDefaults.delete(key)
  end

  #
  # Helper method for setting data into the user defaults
  #
  # If the value is provided, the given key will be set. If the value
  # is nil the given key will be deleted.
  #
  # This method always synchronizes the defaults.
  #
  # @param key [String|Symbol] The key to set or delete
  # @param value [Object|Nil] The value to set
  # @return [Nil]
  def []=(key, value)
    if value
      setObject(value, forKey:key.to_s)
    else
      delete(key.to_s)
    end
    sync
  end

  #
  # Helper method for retrieving an object from the defaults
  #
  # @note I'm not using the standard MacRuby sugaring here as
  #       I need to to_s the key. Keeps everything constent.
  #
  # @param key [String|Symbol] The key to retrieve
  # @return [Object] The value for the given key
  def [](key)
    objectForKey(key.to_s)
  end

  #
  # Helper to remove an object from the defaults.
  #
  # This method always synchronizes the defaults.
  #
  # @param key [String|Symbol] The key to remove.
  # @return [Nil]
  def delete(key)
    removeObjectForKey(key.to_s)
    sync
  end

  private

  #
  # Wrapper for synchronize that outputs a message on failure.
  # @api private
  def sync
    puts "Failed to synchronize" unless synchronize
  end
end