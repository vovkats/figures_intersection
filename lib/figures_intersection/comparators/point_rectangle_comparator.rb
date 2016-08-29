module FiguresIntersection
  class PointRectangleComparator
    def self.intersect(point:, rectangle:)
      return point if rectangle.include_point?(point)
      []
    end
  end
end