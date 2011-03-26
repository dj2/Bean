module Bean
  class TableDataSource
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def numberOfRowsInTableView(tableView)
      data.length
    end

    def tableView(view, objectValueForTableColumn:column, row:i)
      ident = column.identifier

      if data[i].respond_to?(:[])
        data[i][ident.intern]
      elsif data[i].respond_to?(ident.to_sym)
        data[i].send(ident.to_sym)
      end
    end

    def tableView(table, sortDescriptorsDidChange:old_descriptors)
      data.sortUsingDescriptors(table.sortDescriptors)
      table.reloadData
    end
  end
end