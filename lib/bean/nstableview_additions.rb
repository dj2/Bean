# Extensions to the NSTableView class
class NSTableView
  alias reload reloadData

  #
  # Helper for adding a double click handler to the table
  #
  # The block will be called and provided the sender, clicked column and clicked row
  #
  # @param blk [Proc] The block to execute
  # @return [Nil]
  def on_double_click(&blk)
    @on_double_action = blk
    def self.performDoubleAction(sender); @on_double_action.call(sender, self.clickedColumn, self.clickedRow); end
    setDoubleAction("performDoubleAction:")
  end

  #
  # Helper for adding a click handler to the table
  #
  # The block will be called and provided the sender, clicked column and clicked row
  #
  # @param blk [Proc] The block to execute
  # @return [Nil]
  def on_click(&blk)
    @on_action = blk
    def self.performAction(sender); @on_action.call(sender, self.clickedColumn, self.clickedRow); end
    setAction("performAction:")
  end
end