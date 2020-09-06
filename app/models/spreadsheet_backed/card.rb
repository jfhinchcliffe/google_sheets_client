module SpreadsheetBacked
  class Card
    extend HasSpreadsheet

    attr_reader :title, :topic, :explanation, :example, :notes

    def initialize(card_info_row)
      @title = card_info_row[0]
      @explanation = card_info_row[1]
      @example = card_info_row[2]
      @notes = card_info_row[3]
      @topic = card_info_row[4]
    end

    def self.all
      all_rows_except_title
        .map {|row| self.new(row)}
    end

    def self.find_by(property, value)
      # TODO: Probably a better way to do this... maybe rescue from below?
      return [] unless SpreadsheetBacked::Card.new([]).respond_to? property

      all.select { |card| card.send(property).upcase == value.upcase }
    end

  end
end