require 'faraday'
require 'faraday_middleware'
require 'json'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each{|f| require f}
Dir[File.expand_path('../response/*.rb', __FILE__)].each{|f| require f}


module ChurchCommunityBuilder
  class Client
    include ChurchCommunityBuilder::Client::Contribution
    include ChurchCommunityBuilder::Client::Person

    attr_reader :subdomain, :username, :password

    def initialize(subdomain, username, password)
      @subdomain = subdomain
      @username  = username
      @password  = password
    end

    def get(path, options={})
      connection.get do |req|
        req.url(path, options)
      end.body
    end

    def post(path, req_body)
      connection.post do |req|
        req.url(path)
        req.body = req_body
      end.body
    end

    def put(path, req_body)
      connection.put do |req|
        req.url path
        req.body = req_body
      end
    end

    def delete(path, options = {})
      connection.delete do |req|
        req.url path
      end.body
    end

    def save
      connection.put do |req|
        req.url path
      end.body
    end

    def to_url(hash)
      hash.collect do |key,val|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(val)}"
      end.join('&')
    end

    private

    def connection
      Faraday.new(url: "https://#{subdomain}.ccbchurch.com/api.php") do |connection|
        connection.basic_auth username, password
        connection.response   :logger
        connection.response   :xml
        connection.adapter    Faraday.default_adapter
      end
    end

  end
end
