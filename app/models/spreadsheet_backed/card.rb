module SpreadsheetBacked
  class Card
    extend HasSpreadsheet

    def self.all
      all_rows_except_title
    end

  end
end