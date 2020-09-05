class StaticPagesController < ApplicationController
  def index
    @topic_count = SpreadsheetBacked::Topic.all.count
    @spreadsheet_info = SpreadsheetBacked::Card.all
  end

  def test
  end
end
