class ExampleSerializer < ActiveModel::Serializer
  attribute :id
  attribute :url
  attribute :title
  attribute :summary
  belongs_to :provider

  def url
    # stub atm
    "/providers/#{object.provider_id}/examples/#{object.id}"
  end
end
