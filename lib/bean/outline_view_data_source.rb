module Bean
  class OutlineViewDataSource
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def outlineView(view, numberOfChildrenOfItem:item)
      (item.nil? ? data.length : item[:childRows].length)
    end

    def outlineView(view, isItemExpandable:item)
      item.has_key?(:childRows) && item[:childRows].length > 0
    end

    def outlineView(view, child:child, ofItem:item)
      (item.nil? ? data[child] : item[:childRows][child])
    end

    def outlineView(view, objectValueForTableColumn:column, byItem:item)
      item[column.identifier.intern]
    end
  end
end