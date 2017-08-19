module ChurchCommunityBuilder
  class Person
    attr_reader :response, :people, :count

    def initialize(response)
      @response = response["ccb_api"]["response"]
      @people   = @response["individuals"]
      @count    = @people["count"].to_i
    end

    def parse
      return [] if count == 0 || people["individual"].nil?

      if count == 1 || people["individual"].is_a?(Hash)
        [hydrate(people["individual"])]
      else
        people["individual"].map{|p| hydrate(p) }
      end
    end

    def hydrate(person)
      OpenStruct.new(
        id: person["id"],
        family_id: person["family"]["id"],
        first_name: person["first_name"],
        last_name: person["last_name"],
        email: person["email"],
      )
    end

  end
end
