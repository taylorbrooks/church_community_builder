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
