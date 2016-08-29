module FiguresIntersection
  module StraightLineIntersector
    def intersect(figure)
      if figure.is_a?(Point)
        PointStraightLineComparator.intersect(straight_line: self, point: figure)
      elsif figure.is_a?(Segment)
        StraightLineSegmentComparator.intersect(straight_line: self, segment: figure)
      elsif figure.is_a?(StraightLine)
        StraightLineStraightLineComparator.intersect(first_straight_line: self, second_straight_line: figure)
      elsif figure.is_a?(Rectangle)
        StraightLineRectangleComparator.intersect(straight_line: self, rectangle: figure)
      elsif figure.is_a?(VerticalLine)
        StraightLineVerticalLineComparator.intersect(straight_line: self, vertical_line: figure)
      else
        raise 'Unknown Comparator'
      end
    end
  end
end