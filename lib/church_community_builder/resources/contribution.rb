module ChurchCommunityBuilder
  class Client
    module Contribution

      def create_contribution(contribution_params)
        response = post("?srv=online_giving_insert_gift&#{Addressable::URI.form_encode(contribution_params)}")
        ::Contribution.new(response).parse
      end

    end
  end
end
