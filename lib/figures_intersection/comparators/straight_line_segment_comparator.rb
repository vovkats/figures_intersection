class StraightLineSegmentComparator

  def self.intersect(straight_line:, segment:)
    point =
      if segment.vertical?
        StraightLineVerticalLineComparator.intersect(
          straight_line: straight_line,
          vertical_line: VerticalLine.new(a: segment.x))
      else
        StraightLineStraightLineComparator.intersect(
          first_straight_line: straight_line,
          second_straight_line: segment.to_straight_line)
      end

    return PointSegmentComparator.intersect(point: point, segment: segment) if point.is_a?(Point)
    []
  end
end