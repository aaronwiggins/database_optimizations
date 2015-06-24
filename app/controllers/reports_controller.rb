class ReportsController < ApplicationController
  def all_data

  end

  def welcome_page
    @assebmly_search_choices = Assembly.all.map { |a| a.name }
  end

  def thank_you
    SearchMailer.report(params[:search], params[:email]).deliver_now
  end
end
