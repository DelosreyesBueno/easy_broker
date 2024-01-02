class EasyBrokerService
  BASE_URL = "https://api.stagingeb.com/v1/properties"
  class << self
    def get_title_lists      
      content = JSON.parse(connection.body)
      content.dig('content').map { |x| x.dig('title') }
    end

    def connection
      Faraday.get(BASE_URL) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-Authorization'] = Rails.application.credentials[:easy_broker][:api_key]
      end
    end
  end
end