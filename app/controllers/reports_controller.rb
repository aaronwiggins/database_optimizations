class ReportsController < ApplicationController
  def all_data
    @assembly = Assembly.where("name = ?", params[:name])
    # @hits = []
    # @assembly.sequence.each do |s|
    #   s.genes.each do |g|
    #     g.hits.each do |h|
    #       @hits << h
    #     end
    #   end
    # end
    # @hits.sort! {|a, b| b.percent_similarity <=> a.percent_similarity} #might be able to order if i can get @hits not an array

    genes = Gene.joins(sequence: :assembly).where('assemblies.name ="'+"#{params[:name]}"+'"')

    @hits = []
    genes.each do |g|
      g.hits.order(:percent_similarity).each do |h|
        @hits << h
      end
    end

  end
end
