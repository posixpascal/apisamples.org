class Example < ApplicationRecord
  require "rexml/document"
  belongs_to :provider
  serialize :payload


  def pretty_format(format)
    case format
    when :xml
      document = REXML::Document.new payload.to_xml
      result = ""
      document.write(result, 1)
      result
    when :json
      JSON.pretty_generate(payload)
    end
  end
end
