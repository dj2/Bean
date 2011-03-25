class NSToolbarItem
  def on_click(&blk)
    @on_action = blk
    def self.performAction(sender); @on_action.call(sender); end
    setAction("performAction:")
    setTarget(self)
  end
end