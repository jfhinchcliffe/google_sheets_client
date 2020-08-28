class StaticPagesController < ApplicationController
  def index
    @topic_count = Topic.all.count
    @spreadsheet_info = SheetsClient.new.get_rows
  end
end
