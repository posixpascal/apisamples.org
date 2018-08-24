class HomeController < ApplicationController
  def index
    @pagy, @providers = pagy(Provider.all)
  end
end
