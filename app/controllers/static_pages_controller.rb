class StaticPagesController < ApplicationController
  def index
    @topic_count = Topic.all.count
    @spreadsheet_info = SheetService.new.rows
  end

  def test
  end
end
