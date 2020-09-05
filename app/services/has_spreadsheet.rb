module HasSpreadsheet

  def all_column_values_for(row_header)
    sheet_service.column_by_title(row_header)
  end

  def all_rows_except_title
    sheet_service.all_rows_except_title
  end

  private

  def sheet_service
    @sheet_service ||= SheetService.new
  end



end