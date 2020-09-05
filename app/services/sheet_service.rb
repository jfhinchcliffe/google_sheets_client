class SheetService

  attr_reader :client
  def initialize(client = SheetsClient.new.sheet)
    @client = client
  end

  def column_by_title(searched_title)
    spreadsheet = rows
    title_row = rows[0]

    title_row.each.with_index do |row_title, index|
      return spreadsheet.map { |row| row[index] }.drop(1) if searched_title == row_title
    end
  end

  def all_rows_except_title
    rows.drop(1)
  end

  # TODO: Dynamically get all rows rather than pass 'range'
  def rows(range = 'Sheet1!A1:E')
    get_spreadsheet_data('1eu1Dk67gKnrIgQQ9Fm0Y-RCMzRfZf1UaTQzEt7hjWp0', range)
  end

  def cell(cell_address = 'Sheet1!A1')
    get_spreadsheet_data('1eu1Dk67gKnrIgQQ9Fm0Y-RCMzRfZf1UaTQzEt7hjWp0', cell_address)
  end

  private

  def get_spreadsheet_data(spreadsheet_id, range)
    client
      .get_spreadsheet_values(spreadsheet_id, range)
      .values
  end

end