# Extensions to the NSToolbarItem class
class NSToolbarItem
  #
  # Shortcut for adding an on click handler to the toolbar item.
  #
  # The provided block will be provided the sender when executed.
  #
  # @param blk [Proc] The block to execute on click
  # @return [Nil]
  def on_click(&blk)
    @on_action = blk
    def self.performAction(sender); @on_action.call(sender); end
    setAction("performAction:")
    setTarget(self)
  end
end