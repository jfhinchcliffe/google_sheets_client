module SpreadsheetBacked
  class Topic
    extend HasSpreadsheet

    def self.all
      super("Topic")
    end
  end
end