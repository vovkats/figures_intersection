class SegmentRectangleComparator

  def self.intersect(rectangle:, segment:)
    if segment.vertical?
      points = []

      if rectangle.include_point?(segment.first_point)
        points << segment.first_point
      end

      if rectangle.include_point?(segment.second_point)
        points << segment.second_point
      end

      point = Point.new(x: rectangle.top_left[:x], y: rectangle.top_left[:y])
      if segment.x == rectangle.top_left[:x] && segment.include_point?(point)
        points << point
      end

      point = Point.new(x: rectangle.top_right[:x], y: rectangle.top_right[:y])
      if segment.x == rectangle.top_right[:x] && segment.include_point?(point)
        points << point
      end

      point = Point.new(x: rectangle.bottom_left[:x], y: rectangle.bottom_left[:y])
      if segment.x == rectangle.bottom_left[:x] && segment.include_point?(point)
        points << point
      end

      point = Point.new(x: rectangle.bottom_right[:x], y: rectangle.bottom_right[:y])
      if segment.x == rectangle.bottom_right[:x] && segment.include_point?(point)
        points << point
      end

      points = Point.uniq(points)
      if points.count > 1
        Segment.new(x: points.first.x, y: points.first.y,
                    x1: points.last.x, y1: points.last.y)
      elsif points.count == 1
        points.first
      else
        []
      end
    else
      result = StraightLineRectangleComparator.intersect(
        rectangle: rectangle, straight_line: segment.to_straight_line)

      if result.is_a?(Point)
        result
      elsif result.is_a?(Segment)
        points = []

        points << result.first_point if segment.include_point?(result.first_point)
        points << result.second_point if segment.include_point?(result.second_point)
        points << segment.first_point if rectangle.include_point?(segment.first_point)
        points << segment.second_point if rectangle.include_point?(segment.second_point)

        points = Point.uniq(points)

        if points.count > 1
          Segment.new(x: points.first.x, y: points.first.y, x1: points.last.x, y1: points.last.y)
        else
          points.first
        end
      else
       []
      end
    end
  end
end