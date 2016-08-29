class VerticalLine < Figure
  include VerticalLineIntersector

  attr_reader :a

  def initialize(a:)
    @a = a
    super()
  end

  def ==(vertical_line)
    a == vertical_line
  end

  private

  def valid?
    a.is_a?(Numeric)
  end

  def error_message
    'Parameters should be numeric for VerticalLine'
  end
end
