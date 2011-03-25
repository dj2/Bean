class NSTableView
  alias dataSource= setDataSource
  alias reload reloadData

  def on_double_click(&blk)
    @on_double_action = blk
    def self.performDoubleAction(sender); @on_double_action.call(sender, self.clickedColumn, self.clickedRow); end
    setDoubleAction("performDoubleAction:")
  end

  def on_click(&blk)
    @on_action = blk
    def self.performAction(sender); @on_action.call(sender, self.clickedColumn, self.clickedRow); end
    setAction("performAction:")
  end
end