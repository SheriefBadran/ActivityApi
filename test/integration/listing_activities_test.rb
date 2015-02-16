require 'test_helper'

class ListingActivitiesTest < ActionDispatch::IntegrationTest

  setup { host! 'api.cs-activities-dev.com'}

  test 'returns activities in JSON' do
    get '/activities', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns activities in XML' do
    get '/activities', {}, { 'Accept' => Mime::XML }
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end

  test 'returns activity by id' do
    activity = Activity.create!(name: 'Kalmar Tennisklubb', description: 'Bra tennisklubb', indoors: true, position_id: 1)

    # Routes to Avtivities#show
    get "/activities/#{activity.id}"
    assert_equal 200, response.status

    activity_response = json(response.body)
    assert_equal activity.name, activity_response[:name]
  end
end
