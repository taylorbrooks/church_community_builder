# frozen_string_literal: true

module ChurchCommunityBuilder
  class Campus
    attr_reader :response, :campuses

    def initialize(response)
      @response = response['ccb_api']['response']
      @campuses = @response['campuses']['campus']
    end

    def parse
      @campuses.map do |campus|
        OpenStruct.new(
          id: campus['id'],
          name: campus['name']
        )
      end
    end
  end
end
