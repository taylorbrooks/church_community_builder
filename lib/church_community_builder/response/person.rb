module ChurchCommunityBuilder
  class Person
    attr_reader :response, :people, :count

    def initialize(response)
      @response = response["ccb_api"]["response"]
      @people   = @response["individuals"]
      @count    = @people["count"].to_i
    end

    def parse
      return [] if count == 0

      if count == 1
        [hydrate(people["individual"])]
      else
        people["individual"].map{|p| hydrate(p) }
      end
    end

    def hydrate(person)
      OpenStruct.new(
        id: person["id"],
        first_name: person["first_name"],
        last_name: person["last_name"],
        email: person["email"]
      )
    end

  end
end
