class ExamplesController < ProvidersController
  before_action :set_provider
  before_action :set_example, only: :show
  before_action :set_preferred_format, only: :show

  def index
  end

  def show

  end

  private
  def set_preferred_format
    @preferred_format = :json
    if params[:type]
      @preferred_format = params[:type].to_sym
    end
  end

  def set_provider
    @provider = Provider.find params[:provider_id]
  end

  def set_example
    @example = @provider.examples.find params[:id]
  end
end
