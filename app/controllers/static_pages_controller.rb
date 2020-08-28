class StaticPagesController < ApplicationController
  def index
    @topic_count = Topic.all.count
  end
end
