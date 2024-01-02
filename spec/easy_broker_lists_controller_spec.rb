require 'rails_helper'

RSpec.describe EasyBrokerListsController, type: :request do
  before(:context) do
    @api_url = 'https://api.stagingeb.com/v1/properties'
    @response = EasyBrokerService.connection
  end

  it 'performs a successful GET request' do
    expect(@response.status).to eq(200)
  end
  
  it 'Successfully get the list of 20 records from easybroker' do
    content = JSON.parse(@response.body).dig('content').map { |x| x.dig('title') }
    expect(content.count).to eq 20
  end

end
