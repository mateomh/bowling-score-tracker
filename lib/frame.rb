class Frame
  attr_reader :tries

  def initialize
    @tries = []
  end

  def try_score(score)
    @tries.push(score)
  end
end