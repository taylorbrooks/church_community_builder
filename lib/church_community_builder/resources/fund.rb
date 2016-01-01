module ChurchCommunityBuilder
  class Client
    module Fund

      def list_funds
        response = get("?srv=transaction_detail_type_list")
        ChurchCommunityBuilder::Fund.new(response).parse
      end

    end
  end
end
