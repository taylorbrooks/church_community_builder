# frozen_string_literal: true

module ChurchCommunityBuilder
  class Fund
    attr_reader :response, :funds

    def initialize(response)
      @response = response['ccb_api']['response']
      @funds    = @response['transaction_detail_types']['transaction_detail_type']
    end

    def parse
      @funds.map do |fund|
        OpenStruct.new(
          id: fund['id'],
          name: fund['name']
        )
      end
    end
  end
end
