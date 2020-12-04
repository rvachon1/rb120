class Space
  attr_accessor :mark

  def initialize(mark)
    @mark = mark
  end

  def available?
    Board::SPACES.include?(mark)
  end
end