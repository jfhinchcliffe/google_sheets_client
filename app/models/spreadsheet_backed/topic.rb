module SpreadsheetBacked
  class Topic
    extend HasSpreadsheet

    def self.all
      all_column_values_for("Topic")
    end

  end
end