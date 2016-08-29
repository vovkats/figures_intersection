module FiguresIntersection
  module VerticalLineIntersector
    def intersect(figure)
      if figure.is_a?(Point)
        PointVerticalLineComparator.intersect(vertical_line: self, point: figure)
      elsif figure.is_a?(Segment)
        VerticalLineSegmentComparator.intersect(vertical_line: self, segment: figure)
      elsif figure.is_a?(StraightLine)
        StraightLineVerticalLineComparator.intersect(vertical_line: self, straight_line: figure)
      elsif figure.is_a?(Rectangle)
        VerticalLineRectangleComparator.intersect(vertical_line: self, rectangle: figure)
      elsif figure.is_a?(VerticalLine)
        VerticalLineVerticalLineComparator.intersect(first_vertical_line: self, second_vertical_line: figure)
      else
        raise 'Unknown Comparator'
      end
    end
  end
end
