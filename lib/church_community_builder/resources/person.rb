# frozen_string_literal: true

module ChurchCommunityBuilder
  class Client
    module Person
      def create_person(person_params)
        response = post('?srv=create_individual', Addressable::URI.form_encode(person_params))
        ChurchCommunityBuilder::Person.new(response).parse
      end

      def search_for_person_by_email(email)
        response = get("?srv=individual_search&email=#{email}")
        ChurchCommunityBuilder::Person.new(response).parse
      end

    end
  end
end
