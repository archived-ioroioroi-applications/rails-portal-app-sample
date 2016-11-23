class TopController < ApplicationController
  def index
    time_now = Time.current
    time_yesterday = time_now - 24*60*60
    time_week_from = time_now - 24*60*60*7
    time_week_to = time_now + 24*60*60

    @all_articles = Article.all
      .order("date DESC")

    @daily_articles = Article.where("date like ?","%#{time_now.strftime("%Y/%m/%d")}%") # % は部分一致指定時のワイルドカード
      .order("date DESC")

    @yesterday_articles = Article.where("date like ?","%#{time_yesterday.strftime("%Y/%m/%d")}%")
      .order("date DESC")

    @weekly_articles = Article.where(date: time_week_from.strftime("%Y/%m/%d")..time_week_to.strftime("%Y/%m/%d"))
      .order("date DESC")
  end

  def index_list
    @all_articles = Article.all
      .order("date DESC")
  end
end
