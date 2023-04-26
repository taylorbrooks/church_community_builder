# frozen_string_literal: true

module ChurchCommunityBuilder
  class Error < StandardError; end
end

require 'faraday'
module FaradayMiddleware
  class ChurchCommunityBuilderErrorHandler < Faraday::Middleware
    ERROR_STATUSES = 400..600

    def on_complete(env)
      case env[:status]
      when ERROR_STATUSES
        raise ChurchCommunityBuilder::Error, "#{env[:status]} #{env[:body]}"
      end
    end
  end
end
