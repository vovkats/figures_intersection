module FiguresIntersection
  module RectangleIntersector
    def intersect(figure)
      if figure.is_a?(Point)
        PointRectangleComparator.intersect(rectangle: self, point: figure)
      elsif figure.is_a?(Segment)
        SegmentRectangleComparator.intersect(rectangle: self, segment: figure)
      elsif figure.is_a?(StraightLine)
        StraightLineRectangleComparator.intersect(rectangle: self, straight_line: figure)
      elsif figure.is_a?(Rectangle)
        RectangleRectangleComparator.intersect(first_rectangle: self, second_rectangle: figure)
      elsif figure.is_a?(VerticalLine)
        VerticalLineRectangleComparator.intersect(rectangle: self, vertical_line: figure)
      else
        raise 'Unknown Comparator'
      end
    end
  end
end
