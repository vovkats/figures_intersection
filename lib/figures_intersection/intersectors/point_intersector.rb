module PointIntersector
  def intersect(figure)
    if figure.is_a?(Point)
      PointPointComparator.intersect(first_point: self, second_point: figure)
    elsif figure.is_a?(Segment)
      PointSegmentComparator.intersect(point: self, segment: figure)
    elsif figure.is_a?(StraightLine)
      PointStraightLineComparator.intersect(point: self, straight_line: figure)
    elsif figure.is_a?(Rectangle)
      PointRectangleComparator.intersect(point: self, rectangle: figure)
    elsif figure.is_a?(VerticalLine)
      PointVerticalLineComparator.intersect(point: self, vertical_line: figure)
    else
      raise 'Unknown Comparator'
    end
  end
end
