require 'test_helper'

class Providers::ExamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get providers_examples_index_url
    assert_response :success
  end

  test "should get show" do
    get providers_examples_show_url
    assert_response :success
  end

end
