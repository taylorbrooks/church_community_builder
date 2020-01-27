# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'addressable/uri'
require 'json'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../response/*.rb', __FILE__)].each { |f| require f }

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

    def get(path, options = {})
      connection.get(path, options).body
    end

    def post(path, options = {})
      res = connection.post(path, options).body
      res
    end

    private

    def connection
      Faraday.new(url: "https://#{subdomain}.ccbchurch.com/api.php") do |conn|
        conn.basic_auth username, password
        conn.response   :logger if logger
        conn.response   :xml
        conn.use FaradayMiddleware::ChurchCommunityBuilderErrorHandler
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
