class ReportsController < ApplicationController
  def all_data
    # @assembly = Assembly.where("name = ?", params[:name])
    # genes = Gene.joins(sequence: :assembly).where('assemblies.name ="'+"#{params[:name]}"+'"')
    #
    # @hits = []
    # genes.each do |g|
    #   g.hits.order(:percent_similarity).each do |h|
    #     @hits << h
    #   end
    # end
    #
    # @assembly = Assembly.find_by_name(params[:name])
    # @hits = Hit.where(subject_id: Gene.where(
    #     sequence_id: Sequence.where(
    #     assembly_id: Assembly.where(
    #     name: params[:name])))).order(percent_similarity: :desc)
  end

  def welcome_page
    @assebmly_search_choices = Assembly.all.map { |a| a.name }
  end

  def thank_you
    params[:email]
    params[:search]
    GetDataJob.perform_later(params[:search], params[:email])
    SearchMailer.report(params[:search], params[:email]).deliver_later
  end
end
