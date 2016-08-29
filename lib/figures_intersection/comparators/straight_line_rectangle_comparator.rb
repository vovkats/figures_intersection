module FiguresIntersection
  class StraightLineRectangleComparator

    def self.intersect(straight_line:, rectangle:)
      first_line = Segment.new(x: rectangle.bottom_left[:x],
                               y: rectangle.bottom_left[:y],
                               x1: rectangle.bottom_right[:x],
                               y1: rectangle.bottom_right[:y]).to_straight_line

      second_line = VerticalLine.new(a: rectangle.bottom_right[:x])

      third_line = Segment.new(x: rectangle.top_right[:x],
                               y: rectangle.top_right[:y],
                               x1: rectangle.top_left[:x],
                               y1: rectangle.top_left[:y]).to_straight_line

      fourth_line = VerticalLine.new(a: rectangle.top_left[:x])

      points = []

      points << StraightLineStraightLineComparator.intersect(first_straight_line: straight_line, second_straight_line: first_line)

      points << StraightLineVerticalLineComparator.intersect(straight_line: straight_line, vertical_line: second_line)

      points << StraightLineStraightLineComparator.intersect(first_straight_line: straight_line, second_straight_line: third_line)

      points << StraightLineVerticalLineComparator.intersect(straight_line: straight_line, vertical_line: fourth_line)

      filtered_points =
        points.map do |point|
          point if point.is_a?(Point) && rectangle.include_point?(point)
        end.compact

      uniq_points = Point.uniq(filtered_points)
      if uniq_points.count > 1
        Segment.new(x: uniq_points.first.x, y: uniq_points.first.y,
                    x1: uniq_points.last.x, y1: uniq_points.last.y)
      elsif uniq_points.count == 1
        uniq_points.first
      else
        []
      end
    end
  end
end