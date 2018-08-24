class SearchController < ApplicationController
  def index
    query = params[:q]

    @result = Example.where("title LIKE ?", "%#{query}%")

    render json: @result
  end
end
