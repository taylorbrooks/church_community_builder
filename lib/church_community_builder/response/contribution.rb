module ChurchCommunityBuilder
  class Contribution
    attr_reader :response, :contribution

    def initialize(response)
      @response     = response["ccb_api"]["response"]
      @contribution = @response["items"]["item"]
    end

    def parse
      OpenStruct.new(
        id: contribution["gift_id"],
        amount: contribution["amount"]
      )
    end

  end

  class FamilyContributions
    attr :transactions

    def initialize(response)
      @transactions = response["ccb_api"]["response"]["transactions"]["transaction"]
    end

    def parse
      @transactions.map do |t|
        OpenStruct.new(
          id: t["id"],
          date: t["date"],
          amount: t["transaction_details"]["transaction_detail"]["amount"],
          fund: t["transaction_details"]["transaction_detail"]["coa"]["__content__"],
          note: t["transaction_details"]["transaction_detail"]["note"],
          person: t["individual"]["__content__"],
          person_id: t["individual"]["id"],
        )
      end
    end
  end
end
