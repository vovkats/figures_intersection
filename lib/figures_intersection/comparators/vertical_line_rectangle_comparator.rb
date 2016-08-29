class VerticalLineRectangleComparator

  def self.intersect(vertical_line:, rectangle:)
    first_straight_line = Segment.new(x: rectangle.bottom_left[:x],
                                      y: rectangle.bottom_left[:y],
                                      x1: rectangle.bottom_right[:x],
                                      y1: rectangle.bottom_right[:y]).to_straight_line

    second_straight_line = Segment.new(x: rectangle.top_right[:x],
                                       y: rectangle.top_right[:y],
                                       x1: rectangle.top_left[:x],
                                       y1: rectangle.top_left[:y]).to_straight_line

    points = []

    point = StraightLineVerticalLineComparator.intersect(straight_line: first_straight_line,
                                                   vertical_line: vertical_line)
    points << point if point.is_a?(Point) && rectangle.include_point?(point)

    point = StraightLineVerticalLineComparator.intersect(straight_line: second_straight_line,
                                                   vertical_line: vertical_line)
    points << point if point.is_a?(Point) && rectangle.include_point?(point)

    if points.empty?
      []
    else
      Segment.new(x: points.first.x, y: points.first.y, x1: points.last.x, y1: points.last.y)
    end
  end
end