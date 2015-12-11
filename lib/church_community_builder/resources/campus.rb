module ChurchCommunityBuilder
  class Client
    module Campus

      def list_campuses
        response = get("?srv=campus_list")
        ::Campus.new(response).parse
      end

    end
  end
end
