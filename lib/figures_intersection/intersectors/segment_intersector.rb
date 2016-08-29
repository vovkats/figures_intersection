module FiguresIntersection
  module SegmentIntersector
    def intersect(figure)
      if figure.is_a?(Point)
        PointSegmentComparator.intersect(segment: self, point: figure)
      elsif figure.is_a?(Segment)
        SegmentSegmentComparator.intersect(first_segment: self, second_segment: figure)
      elsif figure.is_a?(StraightLine)
        StraightLineSegmentComparator.intersect(segment: self, straight_line: figure)
      elsif figure.is_a?(Rectangle)
        SegmentRectangleComparator.intersect(segment: self, rectangle: figure)
      elsif figure.is_a?(VerticalLine)
        VerticalLineSegmentComparator.intersect(segment: self, vertical_line: figure)
      else
        raise 'Unknown Comparator'
      end
    end
  end
end
