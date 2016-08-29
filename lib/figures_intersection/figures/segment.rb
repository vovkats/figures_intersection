class Segment < Figure
  ConvertError = Class.new(StandardError)
  include SegmentIntersector

  attr_reader :x, :y, :x1, :y1

  def initialize(x:, y:, x1:, y1:)
    @x = x
    @y = y
    @x1 = x1
    @y1 = y1
    super()
  end

  def ==(figure)
    (figure.x == x && figure.y == y && figure.x1 == x1 && figure.y1 == y1) ||
      (figure.x == x1 && figure.y == y1 && figure.x1 == x && figure.y1 == y)
  end

  def vertical?
    x == x1
  end

  def to_straight_line
    raise ConvertError, 'Can not to convert to straight line' if (x1 - x).zero?

    k = (y1 - y) / (x1 - x).to_f
    b = (x1 * y - x * y1) / (x1 - x).to_f

    StraightLine.new(k: k, b: b)
  end

  def include_point?(point)
    range_x?(point) && range_y?(point)
  end

  def first_point
    @first_point ||= Point.new(x: x, y: y)
  end

  def second_point
    @second_point ||= Point.new(x: x1, y: y1)
  end

  private

  def valid?
    x.is_a?(Numeric) && y.is_a?(Numeric) && x1.is_a?(Numeric) && y1.is_a?(Numeric)
  end

  def error_message
    'Parameters should be numeric for Segment'
  end

  def range_x?(point)
    if x > x1
      point.x >= x1 && point.x <= x
    else
      point.x >= x && point.x <= x1
    end
  end

  def range_y?(point)
    if y > y1
      point.y >= y1 && point.y <= y
    else
      point.y >= y && point.y <= y1
    end
  end
end
