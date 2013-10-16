class Advanced::QuestionnairesController < ApplicationController
  def index
    @descriptor = Advanced::Report::Descriptor.new
    technologies = []
    3.times.each do ||
      technology = Advanced::Report::Technology.new
      technology.water_source = Advanced::Report::WaterSource.new
      technology.costs = Advanced::Report::Cost.new
      technology.costs.capital = Advanced::Report::CapitalCost.new
      technology.costs.recurrent = Advanced::Report::RecurrentCost.new
      technologies << technology
    end
    @descriptor.technologies = technologies
  end
end
