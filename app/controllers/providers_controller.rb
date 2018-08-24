class ProvidersController < ApplicationController
  before_action :set_provider

  def index
  end

  def show
    @pagy, @examples = pagy(@provider.examples)
  end

  private
  def set_provider
    @provider = Provider.find params[:id]
  end
end
