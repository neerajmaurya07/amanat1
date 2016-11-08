class SearchesController < ApplicationController
  before_action :find_search, only: [:show]

  def new
  	@search = Search.new
    @countries = Mehman.uniq.pluck(:country)
    @statuses = Mehman.uniq.pluck(:status)
    @levels = Mehman.uniq.pluck(:level)
  end

  def create
  	@search = Search.create(search_params)
  	redirect_to @search
  end

  def show
  end

private  
  def find_search
  	@search = Search.find(params[:id])
  end

  def search_params
  	params.require(:search).permit(:keywords, :country, :arrival_date_from, :arrival_date_to, 
  		:visa_expiry_date_from, :visa_expiry_date_to, :status, :level)
  end
end
