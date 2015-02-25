require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest

  setup { host! 'api.cs-activities-dev.com'}
  #
  test 'returns categories in JSON' do
  #   get '/categories', {}, { 'Accept' => Mime::JSON }
  #   assert_equal 200, response.status
  #   assert_equal Mime::JSON, response.content_type
  # end
  #
  # test 'returns categories in XML' do
  #   get '/categories', {}, { 'Accept' => Mime::XML }
  #   assert_equal 200, response.status
  #   assert_equal Mime::XML, response.content_type
  end
end
