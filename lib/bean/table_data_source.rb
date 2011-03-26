module Bean
  # A simple table data source. Provided an array it will handle the needed
  # calbacks for the table.
  class TableDataSource
    # The data to provide to the table
    attr_reader :data

    #
    # Create the table data source
    #
    # The elements of the provided data source either need to
    # respond to [] and provide each of the needed keys or,
    # need to respond to methods based on the key names.
    #
    # @param data [Array] The data to be provided to the table
    # @return [Bean::TableDataSource] The new data source
    def initialize(data)
      @data = data
    end

    #
    # Returns the number of rows in the table
    # @api private
    def numberOfRowsInTableView(table)
      data.length
    end

    #
    # Returns the value for the given row and column of the table
    # @api private
    def tableView(table, objectValueForTableColumn:column, row:i)
      ident = column.identifier

      if data[i].respond_to?(:[])
        data[i][ident.intern]
      elsif data[i].respond_to?(ident.to_sym)
        data[i].send(ident.to_sym)
      end
    end

    #
    # Sorts the data based on the current table sort descriptors
    # @api private
    def tableView(table, sortDescriptorsDidChange:old_descriptors)
      data.sortUsingDescriptors(table.sortDescriptors)
      table.reloadData
    end
  end
end