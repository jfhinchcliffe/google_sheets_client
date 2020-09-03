module HasSpreadsheet

  def snoop
    "SNOOOP"
  end

  def all(row_header)
    sheet_service.column_by_title(row_header)
  end

  private

  def sheet_service
    @sheet_service ||= SheetService.new
  end



end