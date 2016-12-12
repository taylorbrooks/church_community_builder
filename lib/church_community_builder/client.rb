require "faraday"
require "faraday_middleware"
require "addressable/uri"
require "json"

Dir[File.expand_path('../resources/*.rb', __FILE__)].each{|f| require f}
Dir[File.expand_path('../response/*.rb', __FILE__)].each{|f| require f}


module ChurchCommunityBuilder
  class Client
    [Campus, Contribution, Fund, Person].each do |resource|
      include resource
    end

    attr_reader :subdomain, :username, :password, :logger

    def initialize(subdomain, username, password, logger = false)
      @subdomain = subdomain
      @username  = username
      @password  = password
      @logger    = logger
    end

    def get(path)
      connection.get do |req|
        req.url(path)
      end.body
    end

    def post(path, body)
      connection.post do |req|
        req.url(path)
        req.body = body if body
      end.body
    end

    private

    def connection
      Faraday.new(url: "https://#{subdomain}.ccbchurch.com/api.php") do |connection|
        connection.basic_auth username, password
        connection.response   :logger if logger
        connection.response   :xml
        connection.adapter    Faraday.default_adapter
      end
    end

  end
end
