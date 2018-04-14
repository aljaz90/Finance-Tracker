class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:warning] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:warning] = "No stocks found!" unless @stock
    end
    render partial: 'users/result'
  end
end