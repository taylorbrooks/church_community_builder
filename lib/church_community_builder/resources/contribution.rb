module ChurchCommunityBuilder
  class Client
    module Contribution

      def create_contribution(contribution_params)
        response = post("?srv=online_giving_insert_gift&#{Addressable::URI.form_encode(contribution_params)}", nil)
        ChurchCommunityBuilder::Contribution.new(response).parse
      end

      def list_contributions_by_family_id(family_id)
        response = get("?srv=transactions_by_family&family_id=#{family_id}")
        ChurchCommunityBuilder::FamilyContributions.new(response).parse
      end

    end
  end
end
