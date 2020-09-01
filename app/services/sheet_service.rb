class SheetService

  attr_reader :client
  def initialize(client = SheetsClient.new.sheet)
    @client = client
  end

  def rows(spreadsheet_id = '1eu1Dk67gKnrIgQQ9Fm0Y-RCMzRfZf1UaTQzEt7hjWp0', range = 'Sheet1!A1:E')
    client
      .get_spreadsheet_values(spreadsheet_id, range)
      .values
  end


end