class ReportsController < ApplicationController
  def all_data
    @assembly = Assembly.where("name = ?", params[:name])
    genes = Gene.joins(sequence: :assembly).where('assemblies.name ="'+"#{params[:name]}"+'"')

    @hits = []
    genes.each do |g|
      g.hits.order(:percent_similarity).each do |h|
        @hits << h
      end
    end

  end

  def welcome_page
    @assebmly_search_choices = Assembly.all.map { |a| a.name }
  end

  def thank_you
    @email = params[:email]
    @assebmly_search = params[:search]

    #kick off job
    # GetDataJob.perform_later(params[:assembly])
  end
end
